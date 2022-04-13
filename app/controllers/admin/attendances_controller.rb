class Admin::AttendancesController < Admin::BaseController
  def index
    @attendances = Attendance.includes(:user).all
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def unapproved
    @unapproved_attendances = Attendance.where(status: :unapproved)
  end

  def approve
    @attendance = Attendance.find(params[:id])
    @attendance.update(status: :approved)
    flash[:success] = '承認しました！'
    redirect_to unapproved_admin_attendances_path
  end
end
