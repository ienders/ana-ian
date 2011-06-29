require 'bundler/capistrano'

default_environment['PATH']='/home/ienders/.gems/bin:/usr/lib/ruby/gems/1.8/bin:/usr/local/bin:/usr/bin:/bin'
default_run_options[:pty] = true

set :user, 'ienders'
set :domain, '173.236.149.180'
set :application, 'ana-ian'

set :repository,  "git@github.com:ienders/ana-ian.git"
set :deploy_to, "/home/ienders/ana-ian.com"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :symlink_db do
    run "ln -s #{deploy_to}/#{shared_dir}/db/production.sqlite3 #{release_path}/db/production.sqlite3" 
  end
end

after "deploy:update_code", "deploy:symlink_db"
