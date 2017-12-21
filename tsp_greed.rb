require_relative 'city'

def distance(location1, location2)
	Math.hypot(location2.x - location1.x, location2.y - location1.y)
end


def nearest_neighbor(graph_of_cities, current_city)
	route = [current_city.name]
	until graph_of_cities[0].nil?
		next_city = graph_of_cities[0]
		graph_of_cities.each do |option|
			if distance(current_city, next_city) > distance(current_city, option)
				next_city = option
			end
		end
		current_city = next_city
		graph_of_cities.delete(next_city)
		route.push(current_city.name)
	end

	return route		
	end


	home = City.new("New York", 5, 10)
	city2 = City.new("London", 20, 20)
	city3 = City.new("Chicago", 0, 9)
	city4 = City.new("San Francisco", 7, 2)
	city5 = City.new("Seattle", 0, 17)

	city_graph = [city2, city3, city4, city5]


	trip_path = nearest_neighbor(city_graph, home)

	puts trip_path