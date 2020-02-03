class AddinstructorToattendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances,:instructor,:integer
  end
end
