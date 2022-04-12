class AttendanceDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def is_clock_in?
    # 勤怠情報で出勤しているかどうか判定するメソッド
    if start_time.present? && end_time.nil?
      return true
    else
      return false
    end
  end

end
