# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
puts 'Destroy all seed data'
Delivery.destroy_all
Request.destroy_all
Store.destroy_all
User.destroy_all
puts 'Destroy seed data finished'

puts 'Create new stores'

test_store1 = Store.create(store_name: "MediaMarkt",
                          store_address: "Eriagstr. 28",
                          store_city: "85053 Ingolstadt",
                          phone_number: "+49 841 96870")

test_store2 = Store.create(store_name: "MediaMarkt",
                          store_address: "Am Südpark 7",
                          store_city: "86633 Neuburg an der Donau",
                          phone_number: "+49 8431 62990")

test_store3 = Store.create(store_name: "Saturn",
                          store_address: "Am Westpark 7",
                          store_city: "85057 Ingolstadt",
                          phone_number: "+49 841 49150")


puts "Finished Stores!"

puts 'Create new requests'

test_request1 = Request.create!(order_number: "AE6734251",
                            name: "Franz Huber",
                            delivery_address: "Wendenstr. 6",
                            city: "85084 Reichertshofen",
                            size: "M",
                            message: "It's a coffee machine",
                            # time_from: DateTime.new(2019,2,5,18,0,0),
                            # time_to: DateTime.new(2019,2,5,20,0,0),
                            phone_number: "+49 1513849629",
                            store: test_store3,
                            time_from: "16:00",
                            time_to: "20:00",
                            price: 500)

test_request2 = Request.create(order_number: "BD84025484",
                            name: "Stefan Bauer",
                            delivery_address: "Schwalbenäcker 10",
                            city: "84089 Aiglsbach",
                            size: "S",
                            message: "I'm home the whole day",
                            # time_from: DateTime.new(2019,2,7,12,0,0),
                            # time_to: DateTime.new(2019,2,7,21,0,0),
                            phone_number: "+49 176039276",
                            store: test_store1,
                            time_from: "12:00",
                            time_to: "21:30",
                            price: 500)

test_request3 = Request.create(order_number: "TN48392664",

                            name: "Walter Simson",
                            delivery_address: "Kapellenweg 12",
                            city: "85119 Ernsgaden",
                            size: "L",
                            message: "Please be careful",
                            # time_from: DateTime.new(2019,2,6,17,0,0),
                            # time_to: DateTime.new(2019,2,6,19,0,0),
                            phone_number: "+49 1508893765",
                            store: test_store2,
                            time_from: "15:00",
                            time_to: "20:30",
                            price: 500)

test_request4 = Request.create!(order_number: "AE2352359",
                            name: "Tobias Müller",
                            delivery_address: "Schulstr. 18",
                            city: "85077 Manching",
                            size: "L",
                            message: "Heavy Washing machine",
                            # time_from: DateTime.new(2019,2,5,18,0,0),
                            # time_to: DateTime.new(2019,2,5,20,0,0),
                            phone_number: "+49 23351723",
                            store: test_store3,
                            time_from: "19:30",
                            time_to: "21:00",
                            price: 500)

test_request5 = Request.create!(order_number: "AE2312384",
                            name: "Klaus Bachhuber",
                            delivery_address: "Augsburger Str. 10",
                            city: "85290 Geisenfeld",
                            size: "L",
                            message: "It's an iPhone",
                            # time_from: DateTime.new(2019,2,5,18,0,0),
                            # time_to: DateTime.new(2019,2,5,20,0,0),
                            phone_number: "+49 23751783",
                            store: test_store1,
                            time_from: "19:00",
                            time_to: "22:00",
                            price: 500)

puts "Finished Requests!"

# Testuser
puts 'Create new Testuser'
user_new = User.create!(
  email: "timo@gmail.com",
  password: "123456",
  first_name: "Timo",
  last_name: "Piechotta")
puts "Finished Testuser timo@gmail.com / 123456"
# puts 'Create routes'
# Route.destroy_all
# test_route1 = Route.create!(start_address: "Eriagstr. 28, Ingolstadt",
#                           end_address: "Von-Reisbachstr. 24, Mainburg",
#                           delivery_radius: 8,
#                           name: "Testroute",
#                           user: user_new)
# puts "Finished Routes!"

# Delivery.destroy_all
# Delivery.create!(status: 1,
#     request: test_request1,
#     user: user_new)
# puts "create new Delivery"
