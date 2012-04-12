require 'fastercsv'
module Tianyi
  module Errors
     class Exceptions < RuntimeError
	    def initialize(response)
	      @response_info = response
	      @response_code = response['code']
	      @error_message = fetch_error_message
	    end

	    def fetch_error_message
	  	  csv_path = "#{RAILS_ROOT}/vendor/plugins/tys_client/lib/exceptions.csv"
	  	  @error_message = "未知错误"
		  FasterCSV.foreach(csv_path, :headers => false) { |row|  @error_message=row[2] if row[0].to_i == @response_code.to_i }

		  if @error_message == "未知错误" or @response_code.to_i < 1000000
		  	puts @response_info.to_json
		  	Tianyi.logger.info("Exception Response: #{@response_info.to_json}")
		  end

		  return @error_message
	    end

	    def to_s
	      @error_message
	    end	    
     end

  	 class RepeatedText  < RuntimeError
	    def initialize(what = "entity")
	      @what = what
	    end
	    def to_s
	      "#{@what.titleize} "
	    end
	  end

	  class RateLimitExceeded  < RuntimeError
	    def initialize(what = "entity")
	      @what = what
	    end
	    def to_s
	      "#{@what.titleize} "
	    end
	  end

	  # Generic unauthorized exception
	  class Unauthorized < RuntimeError
	    def initialize(what = "entity")
	      @what = what
	    end
	    def to_s
	      "#{@what.titleize} 未授权。"
	    end
	  end
	 
	  # Exception class when the action is forbidden
	  class General < RuntimeError
    	def initialize(what = "entity")
	      @what = what
	    end	  	
	    def to_s
	      "#{@what.titleize} 您无法访问该资源。"
	    end
	  end


	  # Generic Not Found exception.
	  class NotFound < RuntimeError
	    def initialize(what = "方法或页面")
	      @what = what
	    end
	    def to_s
	      "无法找到 #{@what} ."
	    end
	  end

	  # Exception class when the action is forbidden
	  class Unavailable < RuntimeError
	    def to_s
	      "您无法访问该资源。"
	    end
	  end	


	  class InformServer < RuntimeError
	    def to_s
	      "服务器异常。"
	    end
	  end

  end
end