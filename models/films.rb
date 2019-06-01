require_relative("../db/sql_runner.rb")
require_relative("customers.rb")
require_relative("tickets.rb")

class Films
  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)\
    @title = options["title"]
    @price = options["price"]
    @id = options["id"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO films (
    title,
    price
    ) VALUES (
      $1, $2
      ) RETURNING id"
      values = [@title, @price]
      films = SqlRunner.run(sql, values).first
      @id = films["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run( sql )
    result = films.map { | film | Films.new( film ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE films SET (
    title,
    price
    ) =
    (
      $1, $2
      )
      WHERE id =$3"
      values = [@title, @price, @id]
      SqlRunner.run( sql, values )
  end

  #Show customers that have viwed a film.
  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run( sql, values)
    return customers.map { | customer | Customers.new( customer )}
  end

  # def films()
  #   sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
  #   values = [@id]
  #   films = SqlRunner.run( sql, values)
  #   return films.map { | film | Films.new( film )}
  # end

end
