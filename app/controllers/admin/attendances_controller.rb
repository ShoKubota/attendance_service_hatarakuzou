class Admin::AttendancesController < Admin::BaseController
  before_action :set_attendance, only: %i[approve destroy show]

  def index
    @attendances = Attendance.includes(:user).all
  end

  def show; end

  def unapproved
    @unapproved_attendances = Attendance.where(status: :unapproved)
  end

  def approve
    @attendance.update(status: :approved) # 勤怠データのステータスを承認済みに更新する
    flash[:success] = '承認しました！' # フラッシュメッセージを表示する
    redirect_to unapproved_admin_attendances_path # 未承認の勤怠データ一覧にリダイレクトする
  end

  def destroy
    @attendance.destroy! # 勤怠データを削除する
    flash[:success] = '勤怠を削除しました！' # フラッシュメッセージを表示する
    redirect_to admin_attendances_path # 勤怠データ一覧にリダイレクトする
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id]) # paramsで指定された勤怠データを検索して、@attendanceインスタンス変数に代入する
  end
end

