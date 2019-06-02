require_relative('../db/sql_runner')

class Employee
  attr_reader :name, :speciality, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @speciality = options['speciality']
  end

  def save()
    sql = "INSERT INTO employees
    (
      name,
      speciality
      )
      VALUES
      (
      $1, $2
      )
      RETURNING id"
      values = [@name, @speciality]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def clients()
    sql = "SELECT clients.*
    FROM clients
    INNER JOIN gymclasses
    ON gymclasses.client_id = clients.id
    WHERE gymclasses.employee_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |client| Client.new(client)  }
  end


  def self.all()
    sql = "SELECT * FROM employees"
    results = SqlRunner.run(sql)
    return results.map { |employee| Employee.new(employee)  }
  end


  def self.find(id)
    sql = "SELECT * FROM employees
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Employee.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM employees"
    SqlRunner.run( sql )

  end

end
