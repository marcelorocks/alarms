class ApiServiceJob < ActiveJob::Base
  queue_as :default

  API_URL = 'https://bellbird.joinhandshake-internal.com/push'

  def perform(alarm_id)
    begin
      body = RestClient.post(
        API_URL,
        {
          alarm_id: alarm_id
        }
      ).body
    rescue StandardError => e
      body = e.response.body
      raise "Posting to API failed: #{body}"
    end

    data = JSON.parse(body)
    data["success"]
  end
end
