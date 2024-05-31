class User < ApplicationRecord
  has_many :bags
  has_many :requests_as_owner, through: :bags, source: :requests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
