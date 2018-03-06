class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       scope.all
    end
  end

  def create?
    return true # anyone can create a company
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end
end
