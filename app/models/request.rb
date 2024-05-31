class Request < ApplicationRecord
  belongs_to :bag
  belongs_to :user

  validates :start_date, :end_date, presence: true

  before_save :calculate_total

  private

  def calculate_total
    rental_days = (end_date - start_date).to_i
    self.total = rental_days * bag.price_per_day
  end

end
