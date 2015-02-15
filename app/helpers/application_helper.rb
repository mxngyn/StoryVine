module ApplicationHelper
  def current_user
     if session[:user_id]
       User.find(session[:user_id])
     else
       nil
     end
   end

   def item_editable?(item)
     if current_user
       item.user.id == session[:user_id] || current_user.admin
     end
   end

   def story_editable?(item)
     if current_user
       item.author.id == session[:user_id] || current_user.admin
     end
   end

  def random_story
    @story = Story.all.sample
  end


end
