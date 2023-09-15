require_relative './album_data_manager.rb'
require_relative '../logic/entities/genre.rb'
require_relative '../logic/entities/music_album.rb'

class GenreData
  include DataManager
  attr_accessor :genre

  def save_to_hash(genres)
    genres_to_save = []
    album_file = './persistence/files/genres.json'
    genres.each do |genre|
      genre_data = {
        'id' => genre.id,
        'name' => genre.name, 
        'items' => [
          genre.items.map(&:id)
        ]
    }    
    genres_to_save.push(genre_data)
    end  
    write_data(genres_to_save, album_file)
  end
end
