class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       scope.all
    end
  end

  def create
    return true # anyone can create a company
  end
end
