require_relative ('../db/sql_runner.rb')
require ('date')
class Transaction


  def initialize (options)
    @id = options['id'].to_i if options['id']
    @value = options['value'].to_i
    @transaction_date = Date.parse(options['transaction_date'])
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
  


end