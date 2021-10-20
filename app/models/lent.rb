class Lent < ApplicationRecord
  belongs_to :room
  validates :startday, :endday, :people,  presence: true
end
