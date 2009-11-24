class CourseInstancesController < ApplicationController
  # GET /course_instances
  # GET /course_instances.xml
  def index
    @course_instances = CourseInstance.active_ones

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_instances }
    end
  end

  # GET /course_instances/1
  # GET /course_instances/1.xml
  def show
    @course_instance = CourseInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_instance }
    end
  end

  # GET /course_instances/new
  # GET /course_instances/new.xml
  def new
    @course_instance = CourseInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_instance }
    end
  end

  # GET /course_instances/1/edit
  def edit
    @course_instance = CourseInstance.find(params[:id])
  end

  # POST /course_instances
  # POST /course_instances.xml
  def create
    @course_instance = CourseInstance.new(params[:course_instance])

    respond_to do |format|
      if @course_instance.save
        flash[:notice] = 'CourseInstance was successfully created.'
        format.html { redirect_to(@course_instance) }
        format.xml  { render :xml => @course_instance, :status => :created, :location => @course_instance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_instances/1
  # PUT /course_instances/1.xml
  def update
    @course_instance = CourseInstance.find(params[:id])

    respond_to do |format|
      if @course_instance.update_attributes(params[:course_instance])
        flash[:notice] = 'CourseInstance was successfully updated.'
        format.html { redirect_to(@course_instance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_instances/1
  # DELETE /course_instances/1.xml
  def destroy
    @course_instance = CourseInstance.find(params[:id])
    @course_instance.destroy

    respond_to do |format|
      format.html { redirect_to(course_instances_url) }
      format.xml  { head :ok }
    end
  end
end
