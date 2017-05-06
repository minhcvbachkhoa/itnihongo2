class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.text :address
      t.text :description
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :images, [:user_id, :category_id, :created_at]
  end
end
