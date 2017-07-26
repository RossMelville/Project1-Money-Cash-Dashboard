require('pry')
require_relative ('../db/sql_runner.rb')
require_relative ('./transaction.rb')
require_relative ('./merchant.rb')
require_relative ('./tag.rb')
require_relative ('../app.rb')

class Account

  attr_reader :id, :name, :balance

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

  def delete()
    sql = "DELETE FROM accounts
        WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.find(id)
    sql = "SELECT * FROM accounts
        WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values).first
    return Account.new(results)
  end

  def self.total_balance
    accounts = Account.all
    total = 0
    accounts.map { |account| total += account.balance }
    return total.to_f.round(2) / 100
  end

  def self.all
    sql = "SELECT * FROM accounts;"
    values = []
    accounts = SqlRunner.run(sql, values)
    return accounts.map { |account| Account.new(account) }
  end

  def self.delete_all
    sql = "DELETE FROM accounts;"
    values = []
    SqlRunner.run(sql, values)
  end



end