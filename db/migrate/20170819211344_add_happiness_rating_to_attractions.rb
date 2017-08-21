class AddHappinessRatingToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :happiness_rating, :integer
  end
end
