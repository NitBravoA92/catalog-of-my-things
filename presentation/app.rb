require_relative '../logic/entities/music_album'
require_relative '../logic/entities/genre'
require_relative '../logic/user_interact'

class App
  attr_accessor :albums, :genre

  def initialize
    @albums = []
    @genre = []
    @uInteract = UserInteract.new
  end

  def add_album
    id = 'AL_' + Random.rand(1..10_000).to_s
    publish_date = @uInteract.publish_date
    # genre = 'LIST TO BE GENERATED'
    on_spotify = @uInteract.on_spotify?

    album = MusicAlbum.new(id, publish_date, genre, on_spotify)
    @albums.push(album)
  end
end
