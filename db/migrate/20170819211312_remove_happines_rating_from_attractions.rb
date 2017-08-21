class RemoveHappinesRatingFromAttractions < ActiveRecord::Migration
  def change
    remove_column :attractions, :happines_rating, :integer
  end
end
