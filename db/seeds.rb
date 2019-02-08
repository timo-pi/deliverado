# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

puts 'Create stores'
Store.destroy_all
test_store1 = Store.create(store_name: "MediaMarkt",
                          store_address: "Eriagstr. 28",
                          store_city: "85053 Ingolstadt")

test_store2 = Store.create(store_name: "MediaMarkt",
                          store_address: "Maria-Probst-Str. 11",
                          store_city: "80939 München")

test_store3 = Store.create(store_name: "Saturn",
                          store_address: "Am Westpark 7",
                          store_city: "85057 Ingolstadt")


puts "Finished Stores!"

puts 'Create requests'
Request.destroy_all
test_request1 = Request.create!(order_number: "AE6734251",
                            name: "Oliver Pocher",
                            delivery_address: "Gaimersheimer Str. 3",
                            city: "85098 Ingolstadt",
                            size: "M",
                            message: "it is a coffee machine",
                            time_from: DateTime.new(2019,2,5,18,0,0),
                            time_to: DateTime.new(2019,2,5,20,0,0),
                            phone_number: "+49 1513849629",
                            store: test_store1)

test_request2 = Request.create(order_number: "BD8402548",
                            name: "Stefan Raab",
                            delivery_address: "Prinzregentenstr. 74",
                            city: "81675 München",
                            size: "S",
                            message: "I'm home the whole day",
                            time_from: DateTime.new(2019,2,7,12,0,0),
                            time_to: DateTime.new(2019,2,7,21,0,0),
                            phone_number: "+49 176039276",
                            store: test_store3)

test_request3 = Request.create(order_number: "TN48392664",

                            name: "Ezgi Seyis",
                            delivery_address: "Promenadenweg 9",
                            city: "84048 Mainburg",
                            size: "L",
                            message: "Please be careful",
                            time_from: DateTime.new(2019,2,6,17,0,0),
                            time_to: DateTime.new(2019,2,6,19,0,0),
                            phone_number: "+49 1508893765",
                            store: test_store2)

puts "Finished Requests!"

puts 'Create routes'
Route.destroy_all
test_route1 = Route.create(start_address: "Eriagstr. 28, Ingolstadt",
                          end_address: "Von-Reisbachstr. 24, Mainburg",
                          delivery_radius: 8,
                          name: "Testroute",
                          user_id: 1)
puts "Finished Routes!"


