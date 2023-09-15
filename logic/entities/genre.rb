class Genre
  attr_accessor :name, :id

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items.push(item)    
  end
end
