class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :category
      t.string :latitude
      t.string :longitude
      t.string :url
      t.string :image_url
      t.string :areaname
      t.string :prefname
      t.string :pr

      t.timestamps
    end
  end
end
