class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    #instantiate object
    @page = Page.new(page_params)
    #save object
    if @page.save
    #redirect and flash notice  if success
      flash[:notice] = 'Page created'
      redirect_to(pages_path)
    else
    #render if fail
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    #find the object
    @page = Page.find(params[:id])
    #update the object
    if @page.update_attributes(page_params)
    #if success redirect with flash msge
      flash[:notice] = 'page updated'
      redirect_to(page_path(@page))
    else
    #else redirect back render to edit
      render('edit')
    end
  end  

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    #find the object
    @page = Page.find(params[:id])
    #delete the object
    @page.destroy
    #flash notice 
    flash[:notice] = 'paged deleted'
    #redirect to index
    redirect_to(pages_path)
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end


end
