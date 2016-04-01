class CreateBusesTable < ActiveRecord::Migration
  def change
  	create_table :buses do |f|
  		f.string :name
  		f.integer :num_seats
  	end
  end
end
