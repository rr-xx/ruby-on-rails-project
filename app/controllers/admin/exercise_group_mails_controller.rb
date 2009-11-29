class Admin::ExerciseGroupMailsController < ApplicationController
  
  def new
    @exercise_groups = ExerciseGroup.has_registrations
  end
  
  def getUsersInExerciseGroup
    eg_id = params["exercise_group_id"]
    @users = []
    @users = User.in_exercise_group eg_id if eg_id != ""
    @exercise_group = ExerciseGroup.find_by_id(eg_id)
  end
  
  def create
    message_body = params["exercise_group_mail"]["message_body"]
    eg_id = params[:to][:exercise_group_id]
    us = User.in_exercise_group eg_id
    ExerciseGroupMails.deliver_message_to_users us, message_body
    redirect_to :back
  end
end
