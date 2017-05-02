class ApplicationController < ActionController::Base
  # TODO:
  # -Review all the before and after action
  # -Implement Pundit

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_user!
  # before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # Path to redirect after sign in depends on the user type
  def after_sign_in_path_for(resource)
    if resource.manager?
      # If the user is a manager, go to manager home
      partner_side_path
    elsif resource.customer?
      # If the user is a customer, go to event selection page
      event_select_path
    elsif resource.delivery_guy?
      # If the user is a delivery guy, go to order acceptance page
      order_acceptance_path
    end
  end

  # Path to redirect after sign out
  def after_sign_out_path_for(resource)
    root_path
  end

end
