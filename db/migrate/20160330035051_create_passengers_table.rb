class CreatePassengersTable < ActiveRecord::Migration
  def change
  	create_table :passengers do |f|
  		f.string :first_name
  		f.string :last_name
  		f.string :email
  	end
  end
end
