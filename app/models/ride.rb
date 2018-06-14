class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets < self.attraction.tickets
       "You do not have enough tickets to ride #{self.attraction.name}"
    elsif self.user.height < self.attraction.min_height
      "GROW SOME INCHES, you're not tall enough for #{self.attraction.name}"
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
    end
  end 



end
