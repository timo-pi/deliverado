class DeliveryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def edit?
    show?
  end

  def create?
    true
  end

  def update?
    edit?
  end

  def nav?
    show?
  end
end
