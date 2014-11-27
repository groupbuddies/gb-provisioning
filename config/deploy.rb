set :repo_url, 'git://github.com/groupbuddies/gb-puppet-test-app.git'

server 'localhost', user: 'deploy', roles: %w{web app db}, primary: true

set :default_shell, 'bash -l'
set :ssh_options, { port: 2222, forward_agent: true }

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{.env}
set :linked_dirs,  %w{log public/system}

set :bundle_without, %w(development test deploy).join(' ')
set :keep_releases, 3

set :foreman_export_path, '/home/deploy/.config/upstart/'

namespace :deploy do
  desc 'Restart application'
  after :finishing, 'deploy:cleanup'
end
