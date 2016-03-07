class SchedulePolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    true
  end

  def show?
    current_user_is_creator_of_record?
  end

  def create?
    current_user_is_creator_of_record?
  end

  def update?
    current_user_is_creator_of_record?
  end

  def edit?
    current_user_is_creator_of_record?
  end

  def destroy?
    current_user_is_creator_of_record?
  end

  def current_user_is_creator_of_record?
    user.id == record.user_id
  end
end