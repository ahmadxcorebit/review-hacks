class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.text :image
      t.timestamps
    end
  end
end
