class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :state
      t.string :city
      t.string :latitude
      t.string :longitude
    end

    add_index :locations, :latitude, unique: true
    add_index :locations, :longitude, unique: true
  end
end
