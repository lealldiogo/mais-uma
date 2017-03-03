class SectionsController < ApplicationController

  def index
    @sections = section.all
  end


  def show
    @section = Section.find(params[:id])
  end

end
