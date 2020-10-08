module DOF
  class Indicator
    class << self

      def USD_exchange_rate(date: Date.today, end_date: date)
        raw_response = get(Indicator_Codes::USD, date, end_date)
        response = Responses::RequestResponse.new(raw_response)
      end

      def UDIS_exchange_rate(date: Date.today, end_date: date)
        raw_response = get(Indicator_Codes::UDIS, date, end_date)
        response = Responses::RequestResponse.new(raw_response)
      end

      private

      def get(indicator, initial_date, end_date)
        initial_date = DateFormatter.format(initial_date)
        end_date = DateFormatter.format(end_date)

        Client.get path: "#{Endpoints::INDICATORS}/#{indicator}/#{initial_date}/#{end_date}"
      end
    end
  end
end
