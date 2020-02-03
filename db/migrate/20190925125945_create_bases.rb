class CreateBases < ActiveRecord::Migration[5.2]
  def change
    create_table :bases do |t|
      t.integer :office_no
      t.string :office_name
      t.string :work_kind

      t.timestamps
    end
  end
end
