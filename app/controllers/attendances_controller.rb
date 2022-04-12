class AttendancesController < ApplicationController
  def index
  end

  def new
    @current_user_last_attendance = current_user.attendances.last.decorate
  end
  
  def clockin
    @attendance = current_user.attendances.build(start_time: Time.zone.now)
    if @attendance.save
      flash[:success] = '出勤しました。がんばりましょう！'
      redirect_to new_attendance_path
    end
  end

  def clockout
    # 出勤時間があり、退勤時間がないもの
    @attendance = current_user.attendances.last
    if @attendance && @attendance.end_time.nil?
      @attendance.update(end_time: Time.zone.now)
      flash[:success] = '退勤しました。お疲れ様でした！'
      redirect_to new_attendance_path
    else
      flash[:danger] = '退勤に失敗しました。出勤を確認してください'
      redirect_to new_attendance_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
