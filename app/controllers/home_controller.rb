class HomeController < ApplicationController

  def index
    @rsvp = Rsvp.new(:attend => true, :meal_choice => 'poultry')
  end

end
