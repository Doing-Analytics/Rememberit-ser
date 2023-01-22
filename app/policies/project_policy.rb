# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  
  def create?
    user
  end
  
  def update?
    user && record.user == user
  end

  def destroy?
    user && record.user == user
  end
end