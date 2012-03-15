module Tianyi
  class UserRegister

    def self.metd_name
      "user.register"
    end


    def self.attr_names
      [
        'userId',
        'userValidateCode'
      ]
    end


    for a in attr_names
      attr_accessor a
    end
  end

end

