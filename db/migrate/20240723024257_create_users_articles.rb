class CreateUsersArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :users_articles do |t|
      t.integer :user_id, null: false
      t.integer :article_id, null: false
      t.boolean :liked, default: false
      t.timestamps
    end
  end
end
