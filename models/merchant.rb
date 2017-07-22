require_relative ('../db/sql_runner.rb')

class Merchant

  attr_reader :id, :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants
        (name) VALUES ($1) RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end



  def self.delete_all()
    sql = "DELETE FROM merchants;"
    values = []
    SqlRunner.run(sql, values)
  end

end