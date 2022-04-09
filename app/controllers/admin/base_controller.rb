class Admin::BaseController < ApplicationController
  before_action :admin_user
  layout 'admin/layouts/application'

  private

  def not_authenticated
    # reuire_login時のredirect先を以下に変更する
    redirect_to admin_login_path
  end

  def admin_user
    # adminでない場合は、ログインページへリダイレクトさせる
    redirect_to admin_login_path unless current_user.admin?
  end
end
