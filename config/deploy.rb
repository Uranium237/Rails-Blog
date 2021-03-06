# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'blog'
set :repo_url, 'https://github.com/Uranium237/Rails-Blog.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/deploy/blog'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_init_active_record, true

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/puma.rb', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }


# namespace :puma do
#   desc "restart puma"
#   task :restart do
#     on roles(:app) do
#       execute! :sudo, 'service', 'puma-manager', 'restart'
#     end
#   end
# end
# after 'deploy:publishing', 'puma:restart'