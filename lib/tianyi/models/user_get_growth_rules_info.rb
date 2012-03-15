module Tianyi
  class UserGetGrowthRulesInfo

    def self.metd_name
      "user.getGrowthRulesInfo"
    end


    def self.attr_names
      [
       :grade,
       :growthValue,
       :gradeName,
       :badgesImgUrl,
       :gradeValue
      ]
    end


    for a in attr_names
      attr_accessor a
    end
  end

end

