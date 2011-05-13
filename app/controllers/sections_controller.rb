class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    @section = Section.new
  end
  
  def create
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "Successfully created section."
      redirect_to @section
    else
      render :action => 'new'
    end
  end
  
  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      flash[:notice] = "Successfully updated section."
      redirect_to @section
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Successfully destroyed section."
    redirect_to sections_url
  end
end
