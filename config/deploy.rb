require 'bundler/capistrano'

default_run_options[:pty] = true

set :user, 'ian'
set :domain, 'ana-ian.com'
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
end
