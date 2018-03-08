class UserSelectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def select?
    return true
  end

  def new?
    return true
  end

  def destroy?
    return true
  end
end
