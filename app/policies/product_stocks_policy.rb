class ProductStocksPolicy < ApplicationPolicy
  def create?
    user.manager? and product_stock.section.event.manager_id == user.id
  end

  def update?
    user.manager? and product_stock.section.event.manager_id == user.id
  end

  class Scope < Scope
    def resolve
      if user.manager?
        event = Event.find_by(manager_id: user.id)
        sections = event.sections
        sections_ids = sections.map(&:id)
        scope.where(section_id: sections_ids)
      end
    end
  end
end
