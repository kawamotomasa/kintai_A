class AddToUsersWorkEndTime < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :designated_work_end_time, :datetime
  end
end
