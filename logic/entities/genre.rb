require_relative 'item'

class Genre
  attr_accessor :name, :id

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre = self
  end
end
