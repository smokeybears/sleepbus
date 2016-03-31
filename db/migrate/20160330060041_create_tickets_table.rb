class CreateTicketsTable < ActiveRecord::Migration
  def change
  	create_table :tickets do |f|
  		f.integer :passenger_id
  		f.integer :trip_id
  		
  		f.timestamps
  	end
  end
end
