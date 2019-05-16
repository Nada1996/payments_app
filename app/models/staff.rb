class Staff < ApplicationRecord
    belongs_to :departement

    # validation
    validates_presence_of :name, :salary
end
