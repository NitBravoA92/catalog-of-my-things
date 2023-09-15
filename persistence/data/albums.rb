require_relative '../file_manager'

module AlbumData
  FILENAME = 'albums.json'.freeze

  include FileManager

  def read_all_albums(genres)
    data = read_file(file(FILENAME))
    data.map { |album| json_to_album(album, genres.find { |item| album['genre']['id'] == item.id }) }
  end

  def save_album(albums)
    data = albums.map { |album| album_to_json(album) }
    write_file(file(FILENAME), data)
  end

  def album_to_json(album)
    {
      id: album.id,
      publish_date: album.publish_date,
      on_spotify: album.on_spotify,
      genre: { id: album.genre.id, name: album.genre.name }
    }
  end

  def json_to_album(album_json, genre)
    album = MusicAlbum.new(album_json['id'], album_json['publish_date'], on_spotify: album_json['on_spotify'])
    album.add_genre(genre)
    album
  end
end
