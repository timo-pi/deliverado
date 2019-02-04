# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

puts 'Create requests'
Request.destroy_all
test_request1 = Request.create(order_number: "AE6734251",
                            delivery_address: "Oliver Pocher, Gaimersheimer Str. 3",
                            size: "M",
                            message: "it is a coffee machine",
                            time_from: DateTime.new(2019,2,5,18,0,0),
                            time_to: DateTime.new(2019,2,5,20,0,0),
                            phone_number: "+49 1513849629")


test_request2 = Request.create(order_number: "BD8402548",
                            delivery_address: "Stefan Raab, Sandstr. 56",
                            size: "S",
                            message: "I'm home the whole day",
                            time_from: DateTime.new(2019,2,7,12,0,0),
                            time_to: DateTime.new(2019,2,7,21,0,0),
                            phone_number: "+49 176039276")

test_request3 = Request.create(order_number: "TN48392664",
                            delivery_address: "Ezgi Seyis, Waldweg 27",
                            size: "L",
                            message: "Please be careful",
                            time_from: DateTime.new(2019,2,6,17,0,0),
                            time_to: DateTime.new(2019,2,6,19,0,0),
                            phone_number: "+49 1508893765")

puts "Finished!"
