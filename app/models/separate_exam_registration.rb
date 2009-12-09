class SeparateExamRegistration < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :separate_exam
  
end
