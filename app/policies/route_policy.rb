class RoutePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    record.user = user
  end

  def destroy?
    record.user = user
  end

end
