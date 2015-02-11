class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.timestamps

      t.string :title
      t.text :description
      t.integer :mark
      t.references :album, index: true
    end
  end
end
