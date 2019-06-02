require_relative("models/tickets.rb")
require_relative("models/films.rb")
require_relative("models/customers.rb")

require("pry")

Films.delete_all
Customers.delete_all
Tickets.delete_all

films1 = Films.new({"title" => "Matrix 1", "price" => 10})
films1.save()
films2 = Films.new({"title" => "Matrix 2", "price" => 10})
films2.save()
films3 = Films.new({"title" => "Matrix 3", "price" => 10})
films3.save()
films4 = Films.new({"title" => "Star Wars", "price" => 10})
films4.save()
films5 = Films.new({"title" => "Empire Strikes Back", "price" => 10})
films5.save()
films6 = Films.new({"title" => "Return of the Jedi", "price" => 10})
films6.save()

customers1 = Customers.new({"name" => "Ming the Merciless", "funds" => 10000})
customers1.save()
customers2 = Customers.new({"name" => "Chancellor Mow'ga", "funds" => 10000})
customers2.save()
customers3 = Customers.new({"name" => "Darth Vader", "funds" => 10000})
customers3.save()

tickets1 = Tickets.new({"customer_id" => customers1.id, "film_id" => films1.id})
tickets1.save()
tickets2 = Tickets.new({"customer_id" => customers1.id, "film_id" => films1.id})
tickets2.save()
tickets3 = Tickets.new({"customer_id" => customers2.id, "film_id" => films2.id})
tickets3.save()
tickets4 = Tickets.new({"customer_id" => customers2.id, "film_id" => films2.id})
tickets4.save()
tickets5 = Tickets.new({"customer_id" => customers3.id, "film_id" => films3.id})
tickets5.save()
tickets6 = Tickets.new({"customer_id" => customers3.id, "film_id" => films3.id})
tickets6.save()
tickets7 = Tickets.new({"customer_id" => customers1.id, "film_id" => films4.id})
tickets7.save()
tickets8 = Tickets.new({"customer_id" => customers2.id, "film_id" => films4.id})
tickets8.save()
tickets9 = Tickets.new({"customer_id" => customers3.id, "film_id" => films5.id})
tickets9.save()
tickets10 = Tickets.new({"customer_id" => customers3.id, "film_id" => films5.id})
tickets10.save()
tickets11 = Tickets.new({"customer_id" => customers3.id, "film_id" => films6.id})
tickets11.save()
tickets12 = Tickets.new({"customer_id" => customers3.id, "film_id" => films6.id})
tickets12.save()
tickets13 = Tickets.new({"customer_id" => customers2.id, "film_id" => films6.id})
tickets13.save()
tickets14 = Tickets.new({"customer_id" => customers2.id, "film_id" => films6.id})
tickets14.save()
tickets15 = Tickets.new({"customer_id" => customers1.id, "film_id" => films6.id})
tickets15.save()
tickets16 = Tickets.new({"customer_id" => customers1.id, "film_id" => films6.id})
tickets16.save()

films2.title = "Matrix Revolutions"
films2.update()

customers2.name = "The Borg Queen"
customers2.update()

tickets16.film_id = films1.id
tickets16.update()


binding.pry
nil
