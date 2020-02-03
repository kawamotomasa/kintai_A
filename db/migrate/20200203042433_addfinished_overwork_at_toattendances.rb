class AddfinishedOverworkAtToattendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :finished_overwork_at, :datetime
  end
end
