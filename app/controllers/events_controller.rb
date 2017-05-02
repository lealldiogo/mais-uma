class EventsController < ApplicationController
  # Is this controller being used?
  def index
    @events = events.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
