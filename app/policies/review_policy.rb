class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       scope.all
    end
  end

  def new?
    true
  end

  def create?
    true # anyone can create a company
  end

end
