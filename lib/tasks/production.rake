
namespace :production do

  desc "Perform all the tasks for restarting the app"
  task :restart do
    puts `ls -al`
    puts `bundle install --deployment`
    puts `RAILS_ENV=production rake db:migrate`
    puts `RAILS_ENV=production rake assets:precompile`
#    puts `RAILS_ENV=production rake db:seed`
    puts `service unicorn restart`
  end

end