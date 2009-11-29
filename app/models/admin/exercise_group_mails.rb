class Admin::ExerciseGroupMails < ActionMailer::Base
  
  def message_to_users(users, message_body, sent_at = Time.now)
    list = []
    users.each do |user|
      list << user.email
    end
    subject    "Subject line goes here"
    body       :body => message_body
    recipients list
    from       "ilmo@localhost"
    sent_on    sent_at
  end    
  
  
  
  
end
