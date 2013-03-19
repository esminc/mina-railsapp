set_default :unicorn_worker_processes, 2
set_default :unicorn_pid, "#{deploy_to}/shared/tmp/pids/unicorn.pid"


namespace :unicorn do
  desc 'Generate unicorn configure file'
  task :configure do
    queue! %{
      cat << EOF > #{deploy_to}/shared/config/unicorn.rb
#{erb(File.expand_path('../../../../templates/unicorn.rb.erb', __FILE__))}
EOF
    }
  end

  desc "Restart unicorn using 'upgrade'"
  task :restart => :environment do
    queue! %{
      test -s "#{unicorn_pid}" && kill -USR2 `cat "#{unicorn_pid}"` && echo "Restart Ok"
    }
  end
end
