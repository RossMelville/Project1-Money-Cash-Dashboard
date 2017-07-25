require_relative ('..db/sql_runner.rb')
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

end