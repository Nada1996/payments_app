class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.integer :bonus_percentage
      t.integer :salary

      t.timestamps
    end
  end
end
