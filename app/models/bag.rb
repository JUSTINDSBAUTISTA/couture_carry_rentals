class Bag < ApplicationRecord
  belongs_to :user

  CONDITIONS = ['new', 'like-new', 'used']
  validates :condition, inclusion: { in: CONDITIONS }
  include PgSearch::Model
  pg_search_scope :search_by_brand,
    against: [ :brand ],
    using: {
      tsearch: { prefix: true }
    }
end
