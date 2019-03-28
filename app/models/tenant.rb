class Tenant < ApplicationRecord
    validates :email, presence: true
    has_many :stay
end
