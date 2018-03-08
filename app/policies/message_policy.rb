class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       scope
    end
  end

  def index
    record.user == user
  end

  def show
    record.user == user
  end

  def create?
    return true # anyone can create a company
  end

  def update?
    user.admin # only admins can edit/update messages
  end

  def destroy?
    user.admin # only admins can edit/update messages
  end
end
