class Dealership < ApplicationRecord
    has_many :cars,  optional: true, dependent: :destroy
end
