class Dealership < ApplicationRecord
    has_many :cars, dependent: :destroy
end
