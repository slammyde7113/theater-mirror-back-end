class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :comment_id
      t.datetime :date_created
      t.references :users, foreign_key: true
      t.references :articles, foreign_key: true
      t.text :title
      t.text :body

      t.timestamps
    end
    add_index :comments, :comment_id
  end
end
