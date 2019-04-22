class Temperature < ApplicationRecord
  validates :date, presence:true
  validates :temp, presence:true
end
