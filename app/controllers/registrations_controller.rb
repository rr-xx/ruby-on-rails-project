class RegistrationsController < ApplicationController
  
  def create
    g = ExerciseGroup.find_by_id(params[:id])
    g.users << current_user
    redirect_to :back
    return
  end
  
end
