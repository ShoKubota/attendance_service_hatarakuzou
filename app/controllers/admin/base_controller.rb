class Admin::BaseController < ApplicationController
  before_action :admin_user
  layout 'admin/layouts/application'

  private

  def not_authenticated
    # reuire_login時のredirect先を以下に変更する
    flash[:danger] = 'ログインしてください'
    redirect_to admin_login_path
  end

  def admin_user
    # adminでない場合は、ログインページへリダイレクトさせる
    return if current_user.admin?

    flash[:danger] = '管理者のみ閲覧できます'
    redirect_to admin_login_path
  end
end
