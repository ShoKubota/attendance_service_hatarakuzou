class AddUserIdToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendances, :user, foreign_key: true
  end
end
