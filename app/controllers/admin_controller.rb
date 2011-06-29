class AdminController < ApplicationController
  
  layout 'admin'
  
  before_filter :authenticate_user!
  
  def index
    @rsvps = Rsvp.order('updated_at DESC').all
  end
  
end