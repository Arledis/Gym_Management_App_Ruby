require_relative('../db/sql_runner')

class GymClass
  attr_reader :name, :employee_id, :client_id, :capacity, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['className']
    @employee_id = options['employee_id'].to_i
    @client_id = options['client_id'].to_i
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO gymclasses
    (
    name,
    employee_id,
    client_id,
    capacity
    )
    VALUES
    (
    $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @employee_id, @client_id, @capacity]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM gymclasses"
    results = SqlRunner.run( sql, values )
    return results.map { |gymclass| GymClass.new(gymclass)  }
  end

  def client()
    sql = "SELECT * FROM clients
    WHERE id = $1"
    values = [@client_id]
    results = SqlRunner.run( sql, values )
    return Client.new( results.first )
  end

  def employee()
    sql = "SELECT * FROM employees
    WHERE id = $1"
    values = [@employee_id]
    results = SqlRunner.run( sql, values )
    return Employee.new( results.first )
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
