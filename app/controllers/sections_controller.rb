class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def create
    #instantiate the object
    @section = Section.new(section_params)
    #save the object
    if @section.save    
    #if success redirect + flash message
      flash[:notice] = 'section created'
      redirect_to(sections_path)
    #else render back
    else
      render('new')
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    #find object
    @section = Section.find(params[:id])
    #update object
    if @section.update_attributes(section_params)
    #if success flash notice + redirect to show
      flash[:notice] = 'section updated'
      redirect_to(section_path(@section))
    #else redirect back to edit
    else
      render('edit')
    end

  end 

  def delete
    @section = Section.find(params[:id])
  end
 
  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = 'section deleted'
    redirect_to(sections_path)
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type)
  end

end
