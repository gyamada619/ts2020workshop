#
# Cookbook:: my-super-cookbook
# Recipe:: default
#
# Copyright:: 2020, Garrett Yamada, All Rights Reserved.

# Let's create a file as a simple test of Chef.
file 'C:\\example.txt' do
  content 'Hello, Tech Summit!'
  action :create
end

# Create temporary caching directory
directory 'C:\\temp' do
  action :create
end

# Now we're going to copy our Chocolatey package to our new node.
cookbook_file 'C:\\temp\\example-wireguard.0.0.38.nupkg' do
  source 'example-wireguard.0.0.38.nupkg'
  action :create
end

# Now that the package exists, let's install it.
chocolatey_package 'example-wireguard' do
  source 'C:\\temp\\'
  action :install
end
