require_relative( '../db/sql_runner.rb' )

class Client
  attr_accessor :name, :membership_type, :contact_details, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @membership_type = options['membership_type']
    @contact_details = options['contact_details']
  end

  def save()
    sql = "INSERT INTO clients
    (
    name,
    membership_type,
    contact_details
    )
    values
    (
    $1, $2, $3
      )
      RETURNING id"
      values = [@name, @membership_type, @contact_details]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE clients
    SET
    (
    name, membership_type, contact_details
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @membership_type, @contact_details]
    SqlRunner.run( sql, values )
  end


  def employees()
    sql = "SELECT employees.*
    FROM employees
    INNER JOIN gymclasses
    ON gymclasses.employee_id = employees.id
    WHERE gymclasses.employee_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql,values)
    return results.map { |employee| Employee.new(employee)  }
  end

  def self.all()
    sql = "SELECT * FROM clients"
    results = SqlRunner.run(sql)
    return results.map { |client| Client.new(client)  }
  end


  def find(id)
    sql = "SELECT * FROM clients WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Client.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM clients"
    SqlRunner.run( sql )
  end


end
