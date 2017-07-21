class Tag

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @icon = options['icon']
  end



end