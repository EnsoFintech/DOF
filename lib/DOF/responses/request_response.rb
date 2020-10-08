module DOF
  module Responses
    class RequestResponse
      NO_ERROR_CODE = 200

      attr_reader :indicators
      attr_reader :response_code
      attr_reader :response_status
      attr_reader :total_indicators

      def initialize(response)
        parse_response(response)
      end

      def parse_response(response)
        @response_code = response["messageCode"]
        @response_status = response["response"]
        @total_indicators = response["TotalIndicadores"]
        @indicators = []

        build_indicator(response["ListaIndicadores"])
      end

      def build_indicator(data)
        data.each do |indicator|
          @indicators << Responses::IndicatorResponse.new(indicator)
        end
      end

      def successful?
        @response_code == NO_ERROR_CODE
      end
    end    
  end
end