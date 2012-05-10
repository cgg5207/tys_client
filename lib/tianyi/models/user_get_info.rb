
module Tianyi
  class  UserGetInfo

    def self.metd_name
      "user.getInfo"
    end


    def self.attr_names
      [
		:userName, 
		:userCity, 
		:userIconUrlBig, 
		:growthValue, 
		:userIconUrlMiddle, 
		:userProvinceId, 
		:userMobile, 
		:nextGradeValue, 
		:gradeName, 
		:gradeValue, 
		:userIcon, 
		:gradeImgUrl, 
		:userType, 
		:userId, 
		:userProvince, 
		:userNickName, 
		:gradedes, 
		:modelId, 
		:userPass, 
		:description, 
		:userCityId, 
		:userEmail, 
		:userStatus, 
		:cMobile, 
		:goldenValue
      ]
    end


    for a in attr_names
      attr_accessor a
    end
  end

end





