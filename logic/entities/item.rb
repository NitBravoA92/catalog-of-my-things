class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :label, :source

  def initialize(id, publish_date)
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def add_genre; end

  def add_author; end

  def add_label; end

  def add_source; end
end
