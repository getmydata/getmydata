class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       scope.all
    end
  end

  def create?
    true # anyone can create a review
  end

  def update?
    user.admin # only admins can edit/update reviews
  end

  def destroy?
    user.admin #only admins can destroy reviews
  end
end
