class CreateWeather < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.datetime :w_day
      t.text :temperature, array: true, default: []
    end

    add_index :weathers, :w_day
  end
end
