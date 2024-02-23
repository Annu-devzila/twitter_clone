class AddFieldsToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :title, :string
    add_column :tweets, :content, :text
    add_column :tweets, :image, :string
    add_column :tweets, :video, :string
  end
end
