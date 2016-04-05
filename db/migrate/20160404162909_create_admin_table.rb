class CreateAdminTable < ActiveRecord::Migration
  def change
  	create_table :admins do |f|
  		f.string :name
  		f.string :password_hash
  	end
  end
end
