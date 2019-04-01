class MainController < ApplicationController
  def index
    @alarm = Alarm.new
    @alarms = Alarm.latest
  end
end
