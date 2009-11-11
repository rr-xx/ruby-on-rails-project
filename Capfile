load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

after "deploy:update", :database_link

task :database_link do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"  
end
