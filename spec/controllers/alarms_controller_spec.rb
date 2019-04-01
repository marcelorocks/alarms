require 'rails_helper'

describe AlarmsController do
  let(:alarm) { FactoryBot.create(:alarm) }

  context 'upvoting' do
    it 'should be successful and reflect upvotes count' do
      patch :upvote, params: { id: alarm.id, format: :js }

      alarm.reload
      expect(alarm.upvotes).to eql(1)
      expect(response.status).to eql(200)
    end
  end
end
