class Car < ApplicationRecord
  belongs_to :dealership, optional: true
end
