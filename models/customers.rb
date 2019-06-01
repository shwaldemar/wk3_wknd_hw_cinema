require_relative("../db/sql_runner.rb")
require_relative("films.rb")
require_relative("tickets.rb")

class Customers

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @name = options["name"]
    @funds = options["funds"]
    @id = options["name"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO customers (
    name,
    funds
    ) VALUES (
      $1, $2
      ) RETURNING id"
      values = [@name, @funds]
      customers = SqlRunner.run( sql, values ).first
      @id = customers["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run( sql )
    result = customers.map { | customer | Customers.new( customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE customers SET (
    name,
    funds
    ) =
    (
      $1, $2
      )
      WHERE id =$3"
      values = [@name, @funds, @id]
      SqlRunner.run( sql, values )
  end

  #Show films a customer has booked to see.
  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run( sql, values)
    return films.map { | film | Films.new( film )}
  end


end
