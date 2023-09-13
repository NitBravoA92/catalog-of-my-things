class Label
  attr_accessor :id, :title, :color, :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end
end
