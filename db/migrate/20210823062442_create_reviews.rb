class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :subject
      t.belongs_to :user
      t.text :user_review
      t.belongs_to :product
      t.timestamps
    end
  end
end
