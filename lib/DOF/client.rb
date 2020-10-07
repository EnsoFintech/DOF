module DOF
  module Client 
    def self.get(path:, body: nil, headers: {})
      response = DOF.connection.get path, body, headers
      JSON.parse(response.body)
    rescue Faraday::ConnectionFailed, Faraday::TimeoutError
      raise DOF::Errors::NetworkError
    end
  end
end
