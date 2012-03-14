module Tianyi
  module Errors

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