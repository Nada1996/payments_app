class CreateDepartements < ActiveRecord::Migration[5.2]
  def change
    create_table :departements do |t|
      t.string :name
      t.integer :salary_day
      t.integer :bonus_day
      t.integer :bonus_percentage

      t.timestamps
    end
  end
end
