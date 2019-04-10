require 'net/http'
require 'json'

class ApiRequest
  def initialize
  end

  def request(url)
    response = JSON.parse(Net::HTTP.get(url))
  end
end