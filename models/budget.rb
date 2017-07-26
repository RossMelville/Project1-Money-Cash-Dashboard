require ('pry')
require_relative ('../db/sql_runner.rb')
require_relative ('../app.rb')

class Budget

  attr_reader :balance

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @balance = options['balance'].to_i
  end

  def save
    sql = "INSERT INTO budgets
        (balance)
        VALUES
        ($1)
        RETURNING id;"
    values = [@balance]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end



end