get "/admin" do 
	# unless sessions[:user_id]
	# end
	trips = Trip.all
	erb :login
end