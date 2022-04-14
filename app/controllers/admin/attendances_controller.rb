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
    @attendance.update(status: :approved)
    flash[:success] = '承認しました！'
    redirect_to unapproved_admin_attendances_path
  end

  def destroy
    @attendance.destroy!
    flash[:success] = '勤怠を削除しました！'
    redirect_to admin_attendances_path
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end
end
