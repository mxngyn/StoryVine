desc "This task is called by the Heroku scheduler add-on"
task :update_story_of_the_day => :environment do
  puts "Updating story of the day..."
  Story.of_the_day
  puts "Complete!"
end
