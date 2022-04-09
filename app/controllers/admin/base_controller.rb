class Admin::BaseController < ApplicationController
  before_action :admin_user
  layout 'admin/layouts/application'

  private

  def not_authenticated
    redirect_to admin_login_path
  end

  def admin_user
    redirect_to admin_login_path unless current_user.admin?
  end
end
