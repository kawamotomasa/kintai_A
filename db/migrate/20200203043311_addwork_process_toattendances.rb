class AddworkProcessToattendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances,:work_process, :string
  end
end
