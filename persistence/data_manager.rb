require_relative 'data/albums'
require_relative 'data/genres'

module DataManager
  include GenreData
  include AlbumData
end
