require_relative ('../db/sql_runner.rb')
require_relative ('./merchant.rb')
require_relative ('./tag.rb')
require ('date')
class Transaction

  attr_reader :id, :value, :transaction_date, :merchant_id, :tag_id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @value = options['value'].to_i
    @transaction_date = options['transaction_date']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
        (value, transaction_date, merchant_id, tag_id)
        VALUES
        ($1, $2, $3, $4)
        RETURNING id;"
    values = [@value, @transaction_date, @merchant_id, @tag_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def find()
    sql = "SELECT * FROM transactions 
        WHERE id = $1;"
    values = [@id]
    transaction = SqlRunner.run(sql, values)
    return Transaction.new(transaction)
  end

  def merchant()
    sql = "SELECT * FROM merchants
        WHERE id = $1;"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    merchant = results.map {|result| Merchant.new(result)}
    return merchant.first.name
  end

  def tag()
    sql = "SELECT * FROM tags
        WHERE id = $1;"
    values = [@tag_id]
    results = SqlRunner.run(sql, values)
    tag = results.map {|result| Tag.new(result)}
    return tag.first.name
  end

  def value_to_pounds()
    sql = "SELECT * FROM transactions
        WHERE id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    transaction = results.map {|result| Transaction.new(result)}
    amount = transaction.first.value.to_f.round(2)
    return amount/100
  end

  def update()
    sql = "UPDATE transactions SET
        value = $2,
        transaction_date = $3,
        merchant_id = $4,
        tag_id = $5
        WHERE id = $1;"
    values = [ @id, @value, @transaction_date, @merchant_id,  @tag_id ]
    SqlRunner.run(sql, values)
  end


  
  def self.total_spent
    total = 0
    results = Transaction.all
    results.map { |result| total += result.value }
    return total.to_f.round(2)/100
  end

  def self.delete_all
    sql = "DELETE FROM transactions;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM transactions;"
    values = []
    transactions = SqlRunner.run(sql, values)
    return transactions.map { |transaction| Transaction.new(transaction)}
  end

  def self.tag(id)
    sql = "SELECT * FROM transactions
        WHERE tag_id = $1;"
    values = [id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map { |transaction| Transaction.new(transaction)}
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
        WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values).first
    return Transaction.new(results)
  end

end