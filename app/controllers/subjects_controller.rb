class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end
  
  def create
    #Instantiate a new object using form param
    @subject = Subject.new(subject_params) 
    #save the object
    if @subject.save
    #If save succeeds redirect to index
      flash[:notice] = 'New subject created successfully'
      redirect_to(subjects_path)
    else
    #else redisplay form 
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #find subject object
    @subject = Subject.find(params[:id])
    # update the object 
    if @subject.update_attributes(subject_params)
    # if success redirect to show
      flash[:notce] = 'Subject updated successfully'
      redirect_to(subject_path(@subject))
                  
    # else redirct to edit page
    else
      render ('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = 'Subject deleted'
    redirect_to(subjects_path)
  end

  private
  
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
