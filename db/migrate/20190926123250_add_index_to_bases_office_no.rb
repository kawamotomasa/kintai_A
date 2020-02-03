class AddIndexToBasesOfficeNo < ActiveRecord::Migration[5.2]
  def change
    add_index :bases, :office_no, unique: true
  end
end
