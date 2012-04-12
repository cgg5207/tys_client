require 'benchmark'
module Tianyi
  @@logger = nil
  def self.logger=(logger)
    @@logger = logger
  end
  def self.logger
    @@logger
  end

  module Logging
    @skip_api_logging = nil
    @filter_parameters={}
    class << self
      attr_accessor :skip_api_logging 
      attr_accessor :filter_parameters
    end

    def self.filter_ty_parameter_logging(options = [])      
      # write_inheritable_attribute(:filter_ty_logging, {
      #                             :fields => (options[:fields] || []) 
      #                             })
      # class_inheritable_reader :filter_ty_logging
      @filter_parameters = options[:fields].map{|x|x.to_s}
    end


    def self.log_ty_api(method, params)
      message = method # might customize later
      dump = format_ty_params(params)
      if block_given?
        result = nil
        seconds = Benchmark.realtime { result = yield }
        log_info(message, dump, seconds) unless skip_api_logging
        result
      else
        log_info(message, dump) unless skip_api_logging
        nil
      end
    rescue Exception => e
      exception = "#{e.class.name}: #{e.message}: #{dump}"
      log_info(message, exception)
      raise
    end

    def self.format_ty_params(params)
      params.map { |key,value|  
        if  @filter_parameters.include?key
          "'#{key}'=>[FILTERED]"
        else
          "'#{key}'=>'#{value}'"
        end
      }.join(', ')
    end

    def self.log_info(message, dump, seconds = 0)
      return unless Tianyi.logger
      log_message = "\n\n"+
                    "Processing Tianyi_Api method:#{message} (at #{Time.now.strftime('%y-%m-%d %H:%M:%S')} )\n"+
                    "Parameters:{ #{dump} } \n"+
                    "Completed in (#{seconds}) "

      Tianyi.logger.info(log_message)
    end
    
  end  
end
