require 'mina/railsapp/unicorn'

set_default :logrotate_dir,     '/etc/logrotate.d'
set_default :logrotate_freq,    'daily'
set_default :logrotate_rotate,  100

namespace :logrotate do
  desc 'Generate logrotate configuration file'
  task :configure do
    queue! %{
      cat << 'EOF' > #{deploy_to}/tmp/logrotate
#{erb(File.expand_path('../../../../templates/logrotate.conf.erb', __FILE__))}
EOF
     sudo mv #{deploy_to}/tmp/logrotate #{logrotate_dir}/#{domain}
    }
  end
end
