class AddToUsersWorkStartTime < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :designated_work_start_time, :datetime
  end
end
