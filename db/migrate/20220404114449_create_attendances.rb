class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.datetime :break_start
      t.datetime :break_end
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
