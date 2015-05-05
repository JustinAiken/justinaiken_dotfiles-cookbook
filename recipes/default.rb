#
# Cookbook Name:: justinaiken_dotfiles
# Recipe:: default
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

include_recipe 'git'

node[:justinaiken_dotfiles][:users].each do |user|
  justinaiken_dotfiles user
end
