require 'rails_helper'

describe Alarm do
  let(:alarm) { FactoryBot.create(:alarm) }
  context 'upvoting' do
    it 'should reflect upvotes count' do
      alarm.upvote!
      expect(alarm.upvotes).to eql(1)
    end
  end
end
