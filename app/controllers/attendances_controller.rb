class AttendancesController < ApplicationController
  def index
  end

  def new
  end
  
  def create
    @attendances = current_user.attendances.build
    # 出勤してなければstart_timeに時間を持たせる
    if 
    # 出勤していれば退勤時間を入れて保存する
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
