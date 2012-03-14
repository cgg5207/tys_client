# Include hook code here
tianyi_config = "#{RAILS_ROOT}/config/tianyi.yml"
require 'tianyi'
TIANYI = Tianyi.load_configuration(tianyi_config)
