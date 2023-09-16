require_relative 'item'

class MusicAlbum < Item
  attr_accessor :archived, :on_spotify
  attr_reader :id, :publish_date

  def initialize(id, publish_date, on_spotify: false)
    super(id, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    method = super
    method && @on_spotify = true
  end
end
