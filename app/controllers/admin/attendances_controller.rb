class Admin::AttendancesController < Admin::BaseController
  def index
    @attendances = Attendance.includes(:user).all
  end

  def approve
  end
end
