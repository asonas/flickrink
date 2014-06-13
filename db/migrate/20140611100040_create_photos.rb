class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :flickr_photo_id, unique: true
      t.integer :server_id
      t.integer :rotation
      t.string :secret
      t.string :owner_id
      t.string :username
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
