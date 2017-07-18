class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :article_id
      t.datetime :date_created
      t.references :user, index: true, foreign_key: true
      t.text :title
      t.text :body

      t.timestamps
    end
    add_index :articles, :article_id
  end
end
