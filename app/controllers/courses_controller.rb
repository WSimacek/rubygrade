class CoursesController < ApplicationController
  before_filter :login_required
  in_place_edit_for :gradation, :grade
  in_place_edit_for :registration, :presence
  def index
    @courses = current_user.courses.find(:all)
  end

def assignment
    current_user.courses.find(params[:id]).assignments.create(params[:assignment])
    redirect_to course_path
end

def show
    @course = current_user.courses.find(params[:id])
    @students = @course.students.find(:all, :order => 'last_name')
    @categories = @course.categories.find(:all)
    if params[:category_id]
    @assignments = @course.assignments.find_all_by_category_id(params[:category_id])
    else
      @assignments = @course.assignments.find(:all)
    end
    if params[:category_id]
    @category = Category.find(params[:category_id])
    else 
      @category = @course.categories.find(:all)
    end
  end
  
  
  def new
    @course = current_user.courses.build
    render :layout => false
  end
  
  
  
  def create
    @course = current_user.courses.build(params[:course])
    if @course.save
      flash[:notice] = "Successfully created course."
      redirect_to courses_path
    else
      render :action => 'new'
    end
  end
  
 def attendance 
    current_user.courses.find(params[:id]).attendances.create(params[:attendance])
    redirect_to edit_course_path
end
 
  
  def edit
    @course = current_user.courses.find(params[:id])
    @students = @course.students.find(:all)
    @categories = current_user.categories.find(:all)
    if params[:category_id]
    @attendances = @course.attendances.find_all_by_category_id(params[:category_id])
    else
      @attendances = @course.attendances.find(:all)
    end
    if params[:category_id]
    @category = Category.find(params[:category_id])
    else 
      @category = current_user.categories.find(:all)
    end

  end
  
  def update
    
    @course = current_user.courses.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:notice] = "Successfully updated course."
      redirect_to course_path(@course)
    else
      render :action => 'edit'
    end
  end
  
 
  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = current_user.courses.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end
end 
