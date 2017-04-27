class SectionsController < ApplicationController
  # Is this controller being used?
  def index
    @sections = section.all
  end

  def show
    @section = Section.find(params[:id])
  end
end
