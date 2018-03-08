class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return true
  end

  def profile?
    return true
  end

  def send_messages?
    return true
  end
end
