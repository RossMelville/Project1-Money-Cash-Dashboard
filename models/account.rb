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

  def update
    sql = "UPDATE accounts SET
        name = $2,
        balance = $3
        WHERE id = $1;"
    values = [@id, @name, @balance]
    SqlRunner.run(sql, values)
  end

  def balance_to_pounds()
    sql = "SELECT * FROM accounts
        WHERE id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    account = results.map { |result| Account.new }
    amount = account.first.balance.to_f.round(2)
    return amount/100
  end


  def self.all
    sql = "SELECT * FROM accounts;"
    values = []
    accounts = SqlRunner.run(sql, values)
    return accounts.map { |account| Account.new }
  end

  def self.delete_all
    sql = "DELETE FROM accounts;"
    values = []
    SqlRunner.run(sql, values)
  end



end