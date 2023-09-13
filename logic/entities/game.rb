require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, publish_date, multiplayer, last_played_at)
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    current_date = Date.today
    archieved = current_date.year - @last_played_at.year
    parent_method = super
    parent_method || archieved > 2
  end
end
