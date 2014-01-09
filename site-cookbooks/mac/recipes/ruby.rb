template "setup-bashenv" do
  path "/Users/#{node['user']['name']}/.rbenv/bashenv" 
  source "rbenv.bashenv.erb"
  owner node["user"]["name"]
  group node["user"]["group"]
  mode "0644"
end

bash "rbenv install ruby-1.9.3-p484" do
  code <<-EOH
    source /Users/#{node['user']['name']}/app/rbenv/bashenv
    rbenv install 1.9.3-p484
  EOH
  not_if { Dir.exists?("/Users/#{node['user']['name']}/.rbenv/versions/1.9.3-p484") }
end

bash "rbenv install ruby-2.0.0-p353" do
  code <<-EOH
    source /Users/#{node['user']['name']}/app/rbenv/bashenv
    rbenv install 2.0.0-p353
  EOH
  not_if { Dir.exists?("/Users/#{node['user']['name']}/.rbenv/versions/2.0.0-p353") }
end

bash "rbenv global 2.0.0-p353" do
  code <<-EOH
    source /Users/#{node['user']['name']}/app/rbenv/bashenv
    rbenv global 2.0.0-p353
    rbenv rehash 2.0.0-p353
  EOH
end
