require_relative ('../db/sql_runner.rb')

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


  def self.delete_all()
    sql = "DELETE FROM tags;"
    values = []
    SqlRunner.run(sql, values)
  end

end