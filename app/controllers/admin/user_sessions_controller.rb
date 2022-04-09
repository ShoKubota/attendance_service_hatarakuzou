class Admin::UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user && @user.admin?
      redirect_back_or_to(admin_users_path)
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_users_path
  end
end
