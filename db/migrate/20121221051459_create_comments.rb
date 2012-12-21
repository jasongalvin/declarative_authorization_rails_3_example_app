class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :author_name
      t.string :site_url
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
