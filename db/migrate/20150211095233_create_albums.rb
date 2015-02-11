class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.timestamps
      
      t.string :name
      t.references :author, index: true
    end
  end
end
