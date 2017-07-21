require_relative ('../db/sql_runner.rb')

class Transaction


  def initialize (options)
    @id = options['id'].to_i if options['id']
    @value = options['value'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  


end