class CreateTripsTable < ActiveRecord::Migration
  def change
  	create_table :trips do |t| 
  		t.string :bus_id
  		t.integer :depart_city_id
  		t.integer :end_city_id
  		t.integer :depart_date
  		t.integer :end_date
  		t.timestamps
  	end
  end
end
