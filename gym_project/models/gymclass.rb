require_relative('../db/sql_runner')

class Gymclass
  attr_reader :name, :capacity, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO gymclasses
    (
      name,
      capacity
      )
      VALUES
      (
      $1, $2
      )
      RETURNING id"
      values = [@name, @capacity]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end


  def clients()
    sql = "SELECT clients.*
    FROM clients
    INNER JOIN bookings
    ON bookings.client_id = clients.id
    WHERE bookings.gymclass_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |client| Client.new(client)  }
  end

  def is_space_available
    if @capacity <= clients().size
      return true
    else
      return false
    end
    end

  def self.all()
    sql = "SELECT * FROM gymclasses"
    results = SqlRunner.run(sql)
    return results.map { |employee| Gymclass.new(employee)  }
  end


  def self.find(id)
    sql = "SELECT * FROM gymclasses
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Gymclass.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM gymclasses"
    SqlRunner.run( sql )

  end

  def self.delete(id)
    sql = "DELETE FROM gymclasses
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
