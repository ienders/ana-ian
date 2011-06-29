class RsvpsController < ApplicationController
  
  def create
    @rsvp = Rsvp.find_or_initialize_by_first_name_and_last_name(
      params[:rsvp][:first_name],
      params[:rsvp][:last_name]
    )
    
    if @rsvp.update_attributes(params[:rsvp])
      render :nothing => true
    else
      render :text => @rsvp.errors.full_messages.join(', '), :status => 400
    end
  end
  
end