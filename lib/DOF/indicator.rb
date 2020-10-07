module DOF
  class Indicator
    class << self

      def USD_rate(date: Date.today, end_date: date)
        get(Indicator_Codes::USD, date, end_date)
      end

      def UDIS_rate
        get(Indicator_Codes::UDIS, date, end_date)
      end

      private

      def get(indicator, initial_date, end_date)
        initial_date = format_date(initial_date)
        end_date = format_date(initial_date)

        Client.get path: "#{Endpoints::INDICATORS}/#{indicator}/#{initial_date}/#{end_date}"
      end

      def format_date(date)
        formated_date = ''
        if (date.is_a? String) || (date.is_a? Date)
          formated_date = Date.parse(date.to_s).strftime("%d-%m-%Y")
        else
          raise Errors::PreconditionFailed.new("The date has incorrect format")
        end
      end
    end
  end
end
