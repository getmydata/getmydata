class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       scope.all
    end
  end
  
  def new?
    return true # anyone can add a company
  end
end
