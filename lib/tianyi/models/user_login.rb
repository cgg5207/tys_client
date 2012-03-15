module Tianyi
  class UserLogin

    def self.metd_name
      "user.login"
    end


    def self.attr_names
      [
        :userId,
        :userName,
        :sessionKey,
        :userNickName,
        :retVal,
        :userProvinceId,
        :userProvince,
        :isFirstReg
      ]
    end


    for a in attr_names
      attr_accessor a
    end
  end

end

