class AssignmentsController < ApplicationController
  # GET /assignments
  # GET /assignments.xml

 def index
    @assignments = current_user.assignments.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    @assignment = current_user.assignments.find(params[:id])
     
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.xml
  def new
    @assignment = current_user.assignments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment = current_user.assignments.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.xml
  def create
    @assignment = current_user.assignments.build(params[:assignment])

    respond_to do |format|
      if @assignment.save
        flash[:notice] = 'Assignment was successfully created.'
        format.html { redirect_to(@assignment) }
        format.xml  { render :xml => @assignment, :status => :created, :location => @assignment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.xml
  def update
   params[:assignment][:existing_gradation_attributes] ||= {}
    @assignment = current_user.assignments.find(params[:id])
    @course = @assignment.course

      if @assignment.update_attributes(params[:assignment])
        flash[:notice] = 'Successfully updated Assignment and Grades.'
        redirect_to course_path(@course)
      else
        render :action => 'edit'
      end
    end

  # DELETE /assignments/1
  # DELETE /assignments/1.xml
  def destroy
    @assignment = current_user.assignments.find(params[:id])
    @assignment.destroy
    @course = @assignment.course

    respond_to do |format|
      format.html { redirect_to course_path(@course) }
      format.xml  { head :ok }
    end
  end
end
