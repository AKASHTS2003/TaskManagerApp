class CalendarController < ApplicationController
  def show
    @holidays = HolidayService.fetch_holidays
    Rails.logger.debug "Fetched holidays: #{@holidays.inspect}"
    @tasks = Task.all
  end  
end
