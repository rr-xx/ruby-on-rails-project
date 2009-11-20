class ExerciseGroupsController < ApplicationController
  # GET /exercise_groups
  # GET /exercise_groups.xml
  def index
    @exercise_groups = ExerciseGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exercise_groups }
    end
  end

  # GET /exercise_groups/1
  # GET /exercise_groups/1.xml
  def show
    @exercise_group = ExerciseGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @exercise_group }
    end
  end

  # GET /exercise_groups/new
  # GET /exercise_groups/new.xml
  def new
    @exercise_group = ExerciseGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @exercise_group }
    end
  end

  # GET /exercise_groups/1/edit
  def edit
    @exercise_group = ExerciseGroup.find(params[:id])
  end

  # POST /exercise_groups
  # POST /exercise_groups.xml
  def create
    @exercise_group = ExerciseGroup.new(params[:exercise_group])

    respond_to do |format|
      if @exercise_group.save
        flash[:notice] = 'ExerciseGroup was successfully created.'
        format.html { redirect_to(@exercise_group) }
        format.xml  { render :xml => @exercise_group, :status => :created, :location => @exercise_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @exercise_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exercise_groups/1
  # PUT /exercise_groups/1.xml
  def update
    @exercise_group = ExerciseGroup.find(params[:id])

    respond_to do |format|
      if @exercise_group.update_attributes(params[:exercise_group])
        flash[:notice] = 'ExerciseGroup was successfully updated.'
        format.html { redirect_to(@exercise_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exercise_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_groups/1
  # DELETE /exercise_groups/1.xml
  def destroy
    @exercise_group = ExerciseGroup.find(params[:id])
    @exercise_group.destroy

    respond_to do |format|
      format.html { redirect_to(exercise_groups_url) }
      format.xml  { head :ok }
    end
  end
end
