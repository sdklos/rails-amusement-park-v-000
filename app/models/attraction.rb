class Attraction < ActiveRecord::Base
  validates :name, :tickets, :min_height, :nausea_rating, :happiness_rating, presence: true

  has_many :rides
  has_many :users, through: :rides
end
