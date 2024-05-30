class Bag < ApplicationRecord
  belongs_to :user

  CONDITIONS = ['new', 'like-new', 'used']
  validates :condition, inclusion: { in: CONDITIONS }

end
