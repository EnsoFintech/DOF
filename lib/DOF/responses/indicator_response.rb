require 'bigdecimal'

module DOF
  module Responses
    class IndicatorResponse

      attr_reader :indicador_code
      attr_reader :indicador_type_code
      attr_reader :date
      attr_reader :value

      def initialize(data)
        @indicador_code = data["codIndicador"]
        @indicador_type_code = data["codTipoIndicador"]
        @date = data["fecha"]
        @value = BigDecimal(data["valor"])
      end
    end    
  end
end