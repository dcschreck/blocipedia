class UsersController < ApplicationController
  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = current_user
      @user.standard!
      redirect_to root_path
      flash[:notice] = "Your account has been downgraded."
  end
end
