require 'fileutils'
require 'rubygems'

dir = File.dirname(__FILE__)
templates = File.join(dir, 'generators', 'tianyi', 'templates')
config = File.join('config', 'tianyi.yml')

[config].each do |path| 
  FileUtils.cp File.join(templates, path), File.join(RAILS_ROOT, path) unless File.exist?(File.join(RAILS_ROOT, path))
end
