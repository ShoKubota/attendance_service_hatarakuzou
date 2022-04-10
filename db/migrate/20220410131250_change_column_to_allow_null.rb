class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :attendances, :start_time, :datetime, null: true
    change_column :attendances, :end_time, :datetime, null: true
  end

  def down
    change_column :attendances, :start_time, :datetime, null: false
    change_column :attendances, :end_time, :datetime, null: false
  end
end
