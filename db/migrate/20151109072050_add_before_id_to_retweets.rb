class AddBeforeIdToRetweets < ActiveRecord::Migration
  def change
    add_column :retweets, :before_id, :integer
    
  end
end
