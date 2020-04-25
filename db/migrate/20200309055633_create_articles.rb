class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
	  t.string :title
	  t.text :body
	  t.string :article_image_id
	  t.integer :impressions_count, default: 0
      t.timestamps
    end
  end
end
