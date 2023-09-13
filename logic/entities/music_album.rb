require_relative 'item'

class MusicAlbum < Item
  attr_accessor :archived, :genre, :on_spotify
  attr_reader :id, :publish_date

  def initialize(id, publish_date, archived, genre, on_spotify: false)
    super(id, publish_date)
    @archived = archived
    @genre = genre
    @on_spotify = on_spotify
  end
end
