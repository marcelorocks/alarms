class AlarmsController < ApplicationController
  def create
    @alarm = Alarm.new(alarm_params)
    if @alarm.valid?
      @alarm.save
      @alarms = Alarm.latest
    end
  end

  def upvote
    @alarm = Alarm.find(params[:id])
    @alarm.upvote!
  end

  protected

  def alarm_params
    params.require(:alarm).permit(:description)
  end
end
