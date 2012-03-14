require 'net/http'
require 'open-uri'
module Tianyi
  class Request
    attr_accessor :metd_name
    def initialize(method, options={})
      options = options.clone
      @metd_name = method
      @params = {
        'method' => method,
        'appkey' => ENV['TIANYI_APP_KEY'],
        'format' => ENV['TIANYI_FORMAT'],
        'v'      => ENV['TIANYI_VERSION'],
        'timestamp'=> Time.now.strftime("%Y-%m-%d %H:%M:%S")
      }

      @params.merge!(options)
      str = ENV['TIANYI_SERVER_URL'] + (@params.sort.collect { |c| "#{c[0]}#{c[1]}" }).join("")
      @params["sign"] = Digest::MD5.hexdigest(str).upcase!
    end


    def invoke
      make_friendly(send("post_form"))
    end


    def model_classes
      [
       Tianyi::GetGrowthRulesInfo
      ]
    end


  private
    def post_form
      res = Net::HTTP.post_form(URI.parse(ENV['TIANYI_SERVER_URL']), @params)
    end


    def make_friendly(response)
      raise_errors(response)
      data = parse(response)
      to_classdata(@metd_name,data)
    end


	  def parse(response)
	    Crack::JSON.parse(response.body)
	  end

    
    def errors_format(response)
    	response['errors']
    end


    def paramsname_to_class(name)
      @name_to_class ||= model_classes.find{|x| x.metd_name== name }
    end


    def to_classdata(name,data)
    	if k = paramsname_to_class(name)
	    	data_arr = []
	      data["results"].map{|x| 
	        ginfo = k.to_s.split('::').reduce(Object){|cls, c| cls.const_get(c) }.new
	      	Tianyi::GetGrowthRulesInfo.attr_names.map{|a| ginfo.send("#{a}=",x["#{a}"])}
	      	data_arr << ginfo
	      }
	      return data_arr
    	else
    		return data
    	end
    end


    def raise_errors(response)
      case response.code.to_i
        when 400
          data = errors_format(parse(response))
          raise Tianyi::Errors::RepeatedText.new(data), "(#{response.code}): #{response.message} - #{data['error']}"
        when 401
          data = errors_format(parse(response))
          raise Tianyi::Errors::Unauthorized.new(data), "(#{response.code}): #{response.message} - #{data['error'] if data}"
        when 403
          data = errors_format(parse(response))
          raise Tianyi::Errors::General.new(data), "(#{response.code}): #{response.message} - #{data['error'] if data}"
        when 404
          raise Tianyi::Errors::NotFound.new, "(#{response.code}): #{response.message}"
        when 500
          raise Tianyi::Errors::InformServer.new, "Weibo had an internal error. Please let them know in the group. (#{response.code}): #{response.message}"
        when 502..503
          raise Tianyi::Errors::Unavailable.new, "(#{response.code}): #{response.message}"
      end
    end

  end
end