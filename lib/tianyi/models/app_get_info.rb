
module Tianyi
  class  AppGetInfo

    def self.metd_name
      "app.getInfo"
    end


    def self.attr_names
      [
		:sameAppVersion, 
		:appServicePackageId, 
		:appDeveloper, 
		:appNetType, 
		:relationType, 
		:shopkeeperName, 
		:appSynopsis, 
		:apuserId, 
		:isMallrecommend, 
		:orderRelation, 
		:osList, 
		:downUrl, 
		:appPreviewIcon, 
		:appDownNum, 
		:appRate, 
		:provinces, 
		:appSoftSize, 
		:appCategoryName, 
		:appCategoryId, 
		:adapterList, 
		:appIcon,
		:installSign, 
		:lastCount, 
		:shopName, 
		:appVersion, 
		:appName, 
		:versionName, 
		:appSameVersionId, 
		:appType, 
		:appPriceUnit, 
		:securityTest, 
		:appLanguage, 
		:adapterCheck, 
		:appAddTime, 
		:value, 
		:appRateCount, 
		:isTopicApp, 
		:appCollectCount, 
		:downTimes, 
		:appId, 
		:shopkeeperId, 
		:machineList, 
		:appProvider, 
		:appProviderEmail, 
		:platform, 
		:appPrice, 
		:shopId
      ]
    end


    for a in attr_names
      attr_accessor a
    end
  end

end





