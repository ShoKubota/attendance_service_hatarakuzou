class Attendance < ApplicationRecord
  belongs_to :user

  enum status: {
    unapproved: 0,
    approved: 1
  }

  def clock_in?
    # 勤怠情報で出勤しているかどうか判定するメソッド
    start_time.present? && end_time.nil?
  end

  def status_color
    if status == 'approved'
      return 'bg-light-green'
    elsif status == 'unapproved'
      return 'bg-accent-red'
    end
  end
end
