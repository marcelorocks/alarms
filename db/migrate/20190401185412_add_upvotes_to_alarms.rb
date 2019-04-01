class AddUpvotesToAlarms < ActiveRecord::Migration[5.2]
  def change
    add_column :alarms, :upvotes, :integer
  end
end
