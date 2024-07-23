class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :foreign_id
      t.date :time
      t.string :by
      t.string :url
      t.string :title
      t.string :kind
      t.jsonb :data

      t.timestamps
    end
  end
end
