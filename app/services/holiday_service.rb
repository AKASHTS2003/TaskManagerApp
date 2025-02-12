class HolidayService
  def self.fetch_holidays
    api_key = "XvSJ6Lwev64dKZHfasSMawbev0ZT26Bx" # Replace with your actual API key
    country = "JP" # Change this to your country code
    year = Date.today.year
    current_month = Date.today.month

    url = "https://calendarific.com/api/v2/holidays?api_key=#{api_key}&country=#{country}&year=#{year}"

    begin
      response = HTTParty.get(url)
      if response.success?
        holidays = response.parsed_response.dig("response", "holidays") || []
        
        # Filter holidays to include only those in the current month
        holidays.select do |holiday|
          begin
            holiday_date = Date.parse(holiday["date"]["iso"]) rescue nil
            holiday_date&.month == current_month
          rescue => e
            Rails.logger.error "Error parsing holiday date: #{e.message}"
            false
          end
        end
      else
        Rails.logger.error("Calendar API Error: #{response.code} - #{response.message}")
        []
      end
    rescue StandardError => e
      Rails.logger.error("Calendar API Request Failed: #{e.message}")
      []
    end
  end
end
