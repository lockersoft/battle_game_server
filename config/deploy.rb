set :application, 'battlegameserver'
set :repository, 'git@github.com:lockersoft/battle_game_server.git'
set :repo_url, 'git@github.com:lockersoft/battle_game_server.git'

set :user, 'root'
set :deploy_to, '/home/rails'
set :scm, :git
set :branch, "master"
set :rails_env, "production"
set :deploy_via, :copy
set :keep_releases, 3
set :stages, %w(staging production)
set :default_stage, "production"
set :use_sudo, true

#set :ssh_options, {
#   verbose: :debug
#}

role :web, "battlegameserver.com"
role :app, "battlegameserver.com"
role :db, "battlegameserver.com", :primary => true
# set :format, :pretty
# set :log_level, :debug
 set :pty, true
set :deploy_to, '/home/rails'

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      run 'service unicorn restart'
    end
  end
  
  desc 'Updated'
  task :updated do 
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
