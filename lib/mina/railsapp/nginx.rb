require 'mina/railsapp/unicorn'

set_default :nginx_server_name,     -> { domain }
set_default :nginx_sites_available, -> { "/etc/nginx/sites-available/#{nginx_server_name}" }
set_default :nginx_sites_enabled,   -> { "/etc/nginx/sites-enabled/#{nginx_server_name}" }
set_default :nginx_error_log,       -> { "/var/log/nginx/#{nginx_server_name}_error.log" }
set_default :nginx_access_log,      -> { "/var/log/nginx/#{nginx_server_name}_access.log" }

namespace :nginx do
  desc 'Generate nginx configuration file'
  task :configure do
    queue! %{
      cat << 'EOF' > #{deploy_to}/tmp/nginx
#{erb(File.expand_path('../../../../templates/nginx-site.conf.erb', __FILE__))}
EOF
     sudo mv #{deploy_to}/tmp/nginx #{nginx_sites_available}
     sudo ln -s #{nginx_sites_available} #{nginx_sites_enabled}
    }
  end

  task :reload do
    queue! %{
      sudo nginx -s reload
    }
  end
end
