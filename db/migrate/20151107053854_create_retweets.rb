class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.integer :user_id
      t.integer :micropost_id
      
      t.index :user_id
      t.index :micropost_id
      t.index :created_at

      t.timestamps null: false
    end
  end
end
