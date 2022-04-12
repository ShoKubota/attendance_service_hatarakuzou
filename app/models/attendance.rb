class Attendance < ApplicationRecord
  belongs_to :user

  def clock_in?
    # 勤怠情報で出勤しているかどうか判定するメソッド
    return false if nil?

    start_time.present? && end_time.nil?
  end
end
