class Admin::AttendancesController < Admin::BaseController
  def index
    @attendances = Attendance.includes(:user).all
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def approve; end
end
