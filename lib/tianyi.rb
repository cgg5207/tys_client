
module Tianyi

  class << self
    def load_configuration(tianyi_yaml_file)
      if File.exist?(tianyi_yaml_file)
        if defined? RAILS_ENV
          config = YAML.load_file(tianyi_yaml_file)[RAILS_ENV] 
        else
          config = YAML.load_file(tianyi_yaml_file)           
        end
        apply_configuration(config)
      end
    end

    def apply_configuration(config)
      ENV['TIANYI_APP_KEY']      = config['app_key'].to_s
      ENV['TIANYI_FORMAT']       = config['format'].to_s
      ENV['TIANYI_VERSION']      = config['version'].to_s
      ENV['TIANYI_SERVER_URL']  = config['server_url'].to_s
    end
  end

end    

require "tianyi/errors"
require "tianyi/request"

require "tianyi/models/user_activation"
require "tianyi/models/user_get_growth_rules_info"
require "tianyi/models/user_login"
require "tianyi/models/user_register"

