require "queryparams/version"
require "httpclient"

module QueryParams

  def self.encode(value, key = nil)
    case value
    when Hash  then value.map { |k,v| encode(v, append_key(key,k)) }.join('&')
    when Array then value.map { |v| encode(v, "#{key}[]") }.join('&')
    when nil   then ''
    else            
      "#{URI.encode_www_form_component(key.to_s)}=#{URI.encode_www_form_component(value.to_s)}" 
    end
  end

  private

  def self.append_key(root_key, key)
    root_key.nil? ? key : "#{root_key}[#{key.to_s}]"
  end
end
