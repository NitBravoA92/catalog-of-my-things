require_relative './album_data_manager.rb'
require_relative '../logic/entities/music_album.rb'

class AlbumsData
  include DataManager
  attr_accessor :albums

  def save_to_hash(albums)
    albums_to_save = []
    album_file = './persistence/files/albums.json'
    albums.each do |album|
      album = {'id': album.id, 'Publish date': album.publish_date, 'On spotify': album.on_spotify }
      # add_genre(genre)
      albums_to_save.push(album)
    end  
    write_data(albums_to_save, album_file)
  end

  def read_saved_albums
    saved_albums = []
    albums = read_data
    albums.each do |album|
      saved_albums.push(MusicAlbum.new(album['id'], album['publish_date'], on_spotify: album['on_spotify']))
    end
    saved_albums
  end    
end
