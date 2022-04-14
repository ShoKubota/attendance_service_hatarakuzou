class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[edit update destroy show]
  def index
    @attendances = current_user.attendances
  end

  def new
    @current_user_last_attendance = current_user.attendances.last
  end

  def clockin
    @attendance = current_user.attendances.build(start_time: Time.zone.now)
    return unless @attendance.save

    flash[:success] = '出勤しました。がんばりましょう！'
    redirect_to new_attendance_path
  end

  def clockout
    @attendance = current_user.attendances.last
    # 最新の勤怠状況から「出勤時間があり、退勤時間がないもの」に退勤時間を打刻する
    if @attendance && @attendance.end_time.nil?
      @attendance.update(end_time: Time.zone.now)
      flash[:success] = '退勤しました。お疲れ様でした！'
    else
      flash[:danger] = '退勤に失敗しました。出勤を確認してください'
    end
    redirect_to new_attendance_path
  end

  def edit; end

  def update
    if @attendance.update(attendance_params)
      @attendance.update(status: :unapproved)
      flash[:success] = '勤怠を更新しました！承認されるまでお待ちください'
      redirect_to attendances_path
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy; end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:start_time, :end_time).merge(user_id: current_user.id)
  end
end
