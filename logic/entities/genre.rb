require_relative 'item'
require_relative 'music_album'

class Genre
  attr_accessor :name

  def initialize(id, name, _items)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre = self
  end
end
