define :tbz_package do
  remote_file "#{Chef::Config[:file_cache_path]}/#{params[:name]}.tbz" do
    source   "#{params[:source]}"
    checksum "#{params[:checksum]}"
    action   :create_if_missing

    not_if { ::File.directory?("/Applications/#{params[:name]}.app") }
  end

  execute "expand #{params[:name]}" do
    cwd     "/Applications"
    command "tar -xzvf '#{Chef::Config[:file_cache_path]}/#{params[:name]}.tbz'"

    not_if { ::File.directory?("/Applications/#{params[:name]}.app") }
  end
end
