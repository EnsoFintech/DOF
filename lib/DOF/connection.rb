require 'faraday'
module DOF
  def self.connection
    Faraday.new(url: DOF.base_uri ) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.use Faraday::Response::RaiseError
    end
  end
end
