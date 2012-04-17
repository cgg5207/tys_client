
module Tianyi
  class  TradeDownApp

    def self.metd_name
      "trade.downApp"
    end


    def self.attr_names
      [
        :appNetType, 
        :affixSize, 
        :osName, 
        :affixId, 
        :dlscUrl,
        :isJava, 
        :buildFlag, 
        :machineId, 
        :versionName, 
        :packageName, 
        :brandName,
        :requestPostArg, 
        :machineName, 
        :affixVersion
      ]
    end


    for a in attr_names
      attr_accessor a
    end
  end

end





