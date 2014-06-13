class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :flickr_photo_id, unique: true # pg でbigint的なのにしたい　
      t.integer :server_id
      t.integer :rotation
      t.string :secret
      t.string :owner_id
      t.string :username
      t.text :title
      t.text :description
      t.string :url
      t.string :url_b

      t.timestamps
    end
  end
end
