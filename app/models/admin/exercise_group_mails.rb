class Admin::ExerciseGroupMails < ActionMailer::Base
  
  def message_to_users(users, message_body, sent_at = Time.now)
    list = users.map(&:email)
    subject    "Subject line goes here"
    body       :message_body => message_body
    bcc list
    from       "ilmo@localhost"
    sent_on    sent_at
  end    
  
  
  
  
end
