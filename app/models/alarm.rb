class Alarm < ApplicationRecord
  scope :latest, -> { order(upvotes: :desc, created_at: :desc) }

  before_save :load_ranking
  after_create :post_to_api

  def load_ranking
    # self.ranking = (created_at.to_i - Time.now.to_i) + upvotes.to_i
  end

  def upvote!
    update_column(:upvotes, upvotes.to_i + 1)
  end

  def post_to_api
    ApiServiceJob.perform_later(self.id)
  end
end
