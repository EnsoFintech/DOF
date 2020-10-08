require "DOF/version"
require "DOF/connection"
require "DOF/client"
require "DOF/endpoints"
require "DOF/indicator"
require "DOF/indicator_codes"
require "DOF/responses/request_response"
require "DOF/responses/indicator_response"
require "DOF/date_formatter"
require "DOF/errors/base_error"
require "DOF/errors/precondition_failed"
require "DOF/errors/network_error"

module DOF
  def self.config
    yield self
  end

  def self.version
    @version
  end

  def self.base_uri
    @base_uri
  end

  def self.base_uri=(base_uri)
    @base_uri = base_uri
  end
end
