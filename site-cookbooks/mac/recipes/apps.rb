include_recipe "apps"
include_recipe "dmg"

node["apps"].each do |pkg|
	include_recipe "apps::#{pkg}"
end
