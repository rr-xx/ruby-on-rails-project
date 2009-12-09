class SeparateExamRegistrationsController < ApplicationController
  
  def create
    current_user.separate_exams << SeparateExam.find_by_id( params[:id])
    redirect_to :back
  end
end
