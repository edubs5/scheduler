class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:provider, :uid, :first_name, :last_name,
      :email)
  end
end
