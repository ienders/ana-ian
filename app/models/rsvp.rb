class Rsvp < ActiveRecord::Base

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :first_name, :scope => :last_name

  def self.sum_meal_options
    where(:attend => true).inject({}) do |sum, rsvp|
      sum[rsvp.meal_choice] ||= 0
      sum[rsvp.meal_choice] += 1
      sum
    end
  end

end
