require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, publish_date, publisher, cover_state)
    super(id, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end
end
