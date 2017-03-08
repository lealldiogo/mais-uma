class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :email, :first_name, :last_name, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  scope :delivery_guys, -> { where(type: "DeliveryGuy") }
  scope :customers, -> { where(type: "Customer") }
  scope :managers, -> { where(type: "Manager") }

  def profile_pic_url
    facebook_picture_url ||
    photo ||
    "http://res.cloudinary.com/dr4xmxoal/image/upload/v1487949424/Blank_Club_Website_Avatar_Gray_f1upmh.jpg"
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def self.types
    %w(Manager Customer DeliveryGuy)
  end

  def manager?
    self.type == "Manager"
  end

  def customer?
    self.type == "Customer"
  end

  def delivery_guy?
    self.type == "DeliveryGuy"
  end

end
