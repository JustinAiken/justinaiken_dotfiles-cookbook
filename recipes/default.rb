#
# Cookbook Name:: justinaiken_dotfiles
# Recipe:: default
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

node[:justinaiken_dotfiles][:users].each do |user|
  justinaiken_dotfiles user
end
