class CreateTripsTable < ActiveRecord::Migration
  def change
  	create_table :trips do |t|
  		t.string :bus_id
  		t.integer :depart_city_id
      t.integer :seats_left # I think this should be here the busses talble has the number of seats it hold but we dont want decriment that, so we could either have this or query all tickets for a trip and compare that to the amount of seats for the bus registered with that trip which would be more intuative perhaps but not worth the time that that would add to the request considering it is used for a realtime update of the datepicker
  		t.integer :end_city_id
  		t.date :depart_date
  		t.date :arrive_date
  		t.timestamps
  	end
  end
end
