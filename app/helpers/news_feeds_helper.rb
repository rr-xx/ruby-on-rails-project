module NewsFeedsHelper
  
  
  def print_feed feed
    if feed.user_registration? 
      return "User #{feed.user.name} #{t :registered} - #{time_ago_in_words feed.created_at} ago."
    elsif feed.course_creation? 
      return "#{feed.course.name.capitalize} created - #{time_ago_in_words feed.created_at} ago."
    elsif feed.group_registration? 
      return "#{feed.user.name} registered to #{feed.exercise_group.course_instance.course.name} - #{time_ago_in_words feed.created_at} ago."
    end 
  end
  
end
