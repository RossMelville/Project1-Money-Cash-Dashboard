require_relative ('../db/sql_runner.rb')
require_relative ('./transaction.rb')

class Tag

  attr_reader :id, :name, :icon

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @icon = options['icon']
  end

  def save()
    sql = "INSERT INTO tags
        (name) VALUES ($1) RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def transactions()
    sql = "SELECT * FROM transactions
        WHERE tag_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|result| Transaction.new(result)}
  end

  def total_spent()
    total = 0
    sql = "SELECT * FROM transactions
        WHERE tag_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    results.map { |result| total += result['value'].to_i }
    return total
  end


  def self.all
    sql = "SELECT * FROM tags;"
    values = []
    tags = SqlRunner.run(sql, values)
    return tags.map {|tag| Tag.new(tag)}
  end

  def self.delete_all()
    sql = "DELETE FROM tags;"
    values = []
    SqlRunner.run(sql, values)
  end

end