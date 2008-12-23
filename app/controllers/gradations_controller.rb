class GradationsController < ApplicationController
in_place_edit_for :gradation, :grade


  # GET /gradations
  # GET /gradations.xml
  def index
    @gradations = Gradation.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gradations }
    end
  end

  # GET /gradations/1
  # GET /gradations/1.xml
  def show
    @gradation = Gradation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gradation }
    end
  end

  # GET /gradations/new
  # GET /gradations/new.xml
  def new
    @gradation = Gradation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gradation }
    end
  end

  # GET /gradations/1/edit
  def edit
    @gradation = Gradation.find(params[:id])
  end

  # POST /gradations
  # POST /gradations.xml
  def create
    @gradation = Gradation.new(params[:gradation])

    respond_to do |format|
      if @gradation.save
        flash[:notice] = 'Gradation was successfully created.'
        format.html { redirect_to(@gradation) }
        format.xml  { render :xml => @gradation, :status => :created, :location => @gradation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gradation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gradations/1
  # PUT /gradations/1.xml
  def update
    @gradation = Gradation.find(params[:id])

    respond_to do |format|
      if @gradation.update_attributes(params[:gradation])
        flash[:notice] = 'Gradation was successfully updated.'
        format.html { redirect_to(@gradation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gradation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gradations/1
  # DELETE /gradations/1.xml
  def destroy
    @gradation = Gradation.find(params[:id])
    @gradation.destroy

    respond_to do |format|
      format.html { redirect_to(gradations_url) }
      format.xml  { head :ok }
    end
  end
end
