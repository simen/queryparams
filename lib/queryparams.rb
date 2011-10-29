require "queryparams/version"
require "cgi"

module QueryParams

  def self.encode(value, key = nil)
    q = []
    case value
    when Hash
      value.each { |k,v| q << encode(v, append_key(key,k)) }
    when Array
      value.each_with_index { |v,i| q << encode(v, append_key(key, i)) }
    when nil
      return ''
    else
      return "#{key}=#{CGI.escape(value.to_s)}" 
    end
    q.join('&')
  end

  private

  def self.append_key(root_key, key)
    root_key.nil? ? key : "#{root_key}[#{key.to_s}]"
  end
end
