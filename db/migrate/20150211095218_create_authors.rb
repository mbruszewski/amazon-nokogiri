class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.timestamps

      t.string :name
    end
  end
end
