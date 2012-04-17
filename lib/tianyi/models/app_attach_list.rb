
module Tianyi
  class  AppAttachList

    def self.metd_name
      "app.appAttachList"
    end


    def self.attr_names
      [
		:fileExt,
		:fileName, 
		:fileSize, 
		:fileUrl
      ]
    end


    for a in attr_names
      attr_accessor a
    end
  end

end





