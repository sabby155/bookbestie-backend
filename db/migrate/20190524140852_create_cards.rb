class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :authors
      t.string :image_url
      t.string :description
      t.string :genre
      t.string :published_date
      t.integer :page_count
      t.string :isbn
      t.integer :rating
      t.integer :ratings_count

      t.timestamps
    end
  end
end
