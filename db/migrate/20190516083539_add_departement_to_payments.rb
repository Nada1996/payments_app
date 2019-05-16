class AddDepartementToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :departement, foreign_key: true
  end
end
