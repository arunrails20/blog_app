class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.boolean :approve, :default => false
      t.integer :user_id

      t.timestamps
    end
  end
end
