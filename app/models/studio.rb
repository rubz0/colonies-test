class Studio < ApplicationRecord
    validates :name, :monthly_price, presence: true
    has_many :stay
end
