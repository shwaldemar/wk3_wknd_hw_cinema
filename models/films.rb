require_relative("../db/sql_runner.rb")

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

end
