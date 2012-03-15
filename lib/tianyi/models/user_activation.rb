module Tianyi
  class UserActivation

    def self.metd_name
      "user.Activation"
    end


    def self.attr_names
      [
        :retVal
      ]
    end


    for a in attr_names
      attr_accessor a
    end
  end

end

