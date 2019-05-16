class Departement < ApplicationRecord
    has_many :staffs, dependent: :destroy
    has_many :payments, dependent: :destroy

    # validation
    validates_presence_of :name, :bonus_percentage
end
