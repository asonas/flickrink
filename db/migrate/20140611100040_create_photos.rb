class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :nsid
      t.string :username
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
