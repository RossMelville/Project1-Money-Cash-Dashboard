require_relative ('../db/sql_runner.rb')
require_relative ('./transaction.rb')
require_relative ('./merchant.rb')
require_relative ('./tag.rb')
require_relative ('../app.rb')

class Account

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @balance = options['balance'].to_i
  end

  def save
    sql = "INSERT INTO accounts
        (name, balance)
        VALUES
        ($1, $2)
        RETURNING id;"
    values = [@name, @balance]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end



  def self.delete_all
    sql = "DELETE FROM accounts;"
    values = []
    SqlRunner.run(sql, values)
  end



end