class Availability < ApplicationRecord
  belongs_to :doctor, -> { where('role_id = ?', 1) }, class_name: 'User'
end
