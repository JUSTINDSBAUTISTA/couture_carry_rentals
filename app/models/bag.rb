class Bag < ApplicationRecord
  belongs_to :user
  has_many :requests

  CONDITIONS = ['new', 'like-new', 'used']
  validates :condition, inclusion: { in: CONDITIONS }
end
