class Bag < ApplicationRecord
  CONDITIONS = ['new', 'like-new', 'used']
  validates :condition, inclusion: { in: CONDITIONS }
end
