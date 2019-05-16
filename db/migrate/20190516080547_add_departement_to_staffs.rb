class AddDepartementToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_reference :staffs, :departement, foreign_key: true
  end
end
