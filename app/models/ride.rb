class Ride < ActiveRecord::Base
  validates :user_id, :attraction_id, presence: true

  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.attraction.min_height > self.user.height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      user = User.find_by(id: self.user.id)
      ticket_number = user.tickets - self.attraction.tickets
      happiness = user.happiness + self.attraction.happiness_rating
      nausea = user.nausea + self.attraction.nausea_rating
      user.update(tickets: ticket_number, happiness: happiness, nausea: nausea)
      user.save
      user.reload
      "Thanks for riding the #{self.attraction.name}!"
    end

  end
end
