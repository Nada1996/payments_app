class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :month
      t.integer :year
      t.integer :salaries_payment_day
      t.integer :bonus_payment_day
      t.integer :salaries_total
      t.integer :bonus_total
      t.integer :payments_total

      t.timestamps
    end
  end
end
