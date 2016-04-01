class CreateTripsTable < ActiveRecord::Migration
  def change
  	create_table :trips do |t| 
  		t.string :bus_id
  		t.integer :depart_city_id
      t.integer :seats_left
  		t.integer :end_city_id
  		t.date :depart_date
  		t.date :arrive_date
  		t.timestamps
  	end
  end
end
