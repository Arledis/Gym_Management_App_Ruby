require_relative('../db/sql_runner')

class Booking
  attr_reader :gymclass_id, :client_id, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @gymclass_id = options['gymclass_id'].to_i
    @client_id = options['client_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (
    gymclass_id,
    client_id
    )
    VALUES
    (
    $1, $2
    )
    RETURNING id"
    values = [@gymclass_id, @client_id]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql)
    return results.map { |booking| Booking.new(booking)  }
  end

  def client()
    sql = "SELECT * FROM clients
    WHERE id = $1"
    values = [@client_id]
    results = SqlRunner.run( sql, values )
    return Client.new( results.first )
  end

  def self.clients_in_class(class_id)
    sql = "SELECT * from bookings WHERE gymclass_id = $1"
    values = [class_id]
    results = SqlRunner.run( sql, values )
    return results.count
  end

  def gymclass()
    sql = "SELECT * FROM gymclasses
    WHERE id = $1"
    values = [@gymclass_id]
    results = SqlRunner.run( sql, values )
    return Gymclass.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end


end
