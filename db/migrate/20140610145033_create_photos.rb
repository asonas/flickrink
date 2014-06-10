class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :nsid
      t.string :username
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
