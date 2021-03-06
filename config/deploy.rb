require 'bundler/capistrano'

set :application, 'ana-ian'
set :user, 'deploy'
set :runner, user
set :domain, '173.203.198.117'
set :scm, 'git'
set :repository,  "git@github.com:ienders/ana-ian.git"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :source_profile, ''
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

namespace :deploy do
  task :after_update_code do
    link_up_cache
  end

  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :symlink_db do
    run "ln -s #{deploy_to}/#{shared_dir}/db/production.sqlite3 #{release_path}/db/production.sqlite3" 
  end

  desc "Symlink in CMS upload directories to the current release"
  task :link_up_cache do
    run <<-CMD
    ln -nfs #{shared_path}/stylesheet_cache #{release_path}/public/stylesheets/cache &&
    ln -nfs #{shared_path}/javascript_cache #{release_path}/public/javascripts/cache
    CMD
  end

end

after "deploy:update_code", "deploy:symlink_db"
