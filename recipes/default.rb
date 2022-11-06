
include_recipe 'errbit-last::mongodb'
include_recipe 'errbit-last::installruby'
include_recipe 'errbit-last::errbit'

apt_update do
    action :update
  end

