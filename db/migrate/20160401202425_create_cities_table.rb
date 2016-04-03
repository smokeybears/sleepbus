class CreateCitiesTable < ActiveRecord::Migration
  def change
  	create_table :cities do |f|
  		f.string :name
  	end
  end
end
