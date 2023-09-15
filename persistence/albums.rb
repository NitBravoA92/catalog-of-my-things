require_relative 'data_manager'

class AlbumsData
  attr_accessor :albums

  def initialize(albums)
    @albums = albums
  end

  def save_to_hash
    albums = []
    album_file = './persistence/files/albums.json'
    @albums.each do |album|
      album_to_save = {'id': album.id, 'Publish date': album.publish_date, 'On spotify': album.on_spotify }
      albums.push(album_to_save)
    end  
    write_data(albums, album_file)
  end

  # def save_from_hash
  #     id = album['id']
  #     publish_date = album['publish_date']
  #     on_spotify = album['on_spotify']
  # end    
end
