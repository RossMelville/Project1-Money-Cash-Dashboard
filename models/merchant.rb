require_relative ('../db/sql_runner.rb')
require_relative ('./transaction.rb')

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

  def transactions()
    sql = "SELECT * FROM transactions
        WHERE merchant_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Transaction.new(result) }
  end

  def total_spent()
    total = 0
    sql = "SELECT * FROM transactions
        WHERE merchant_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    results.map { |result| total += result['value'].to_i}
    return total
  end



  def self.delete_all()
    sql = "DELETE FROM merchants;"
    values = []
    SqlRunner.run(sql, values)
  end

end