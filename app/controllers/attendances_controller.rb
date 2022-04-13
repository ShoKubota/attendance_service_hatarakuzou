class AttendancesController < ApplicationController
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

  def update; end

  def destroy; end
end
