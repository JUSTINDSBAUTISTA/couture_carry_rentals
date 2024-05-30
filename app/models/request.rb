class Request < ApplicationRecord
  belongs_to :bag
  belongs_to :user

  validates :start_date, :end_date, presence: true
end
