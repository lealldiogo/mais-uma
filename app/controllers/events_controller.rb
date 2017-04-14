class EventsController < ApplicationController

  def index
    @events = events.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
