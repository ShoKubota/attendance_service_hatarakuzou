class AddStatussToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :status, :integer, after: :end_time, default: 0
  end
end
