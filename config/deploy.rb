set :application, 'battle_game_server'
set :repository, 'git@github.com:lockersoft/battle_game_server.git'
set :user, 'battleserver'
set :deploy_to, '/home/rails/'
set :scm, :git
set :user_sudo, false
set :rails_env, "production"

default_run_options[:pty] = true

role :web, "battleserver.com"
role :app, "battleserver.com"
role :db, "battleserver.com", :primary => true
# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute 'service unicorn restart'
    end
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
