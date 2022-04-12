class RemoveStatusFromAttendances < ActiveRecord::Migration[6.1]
  def up
    remove_column :attendances, :status
  end

  def down
    add_column :attendances, :status, :boolean
  end
end
