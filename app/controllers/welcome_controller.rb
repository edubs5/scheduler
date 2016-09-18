class WelcomeController < ApplicationController
  def index
    redirect_to schedules_path unless current_user.nil?
  end
end