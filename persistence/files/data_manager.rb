require_relative 'data/label_data'
require_relative 'data/book_data'
require_relative 'data/albums2'
require_relative 'data/genre2'

module DataManager
  include LabelData
  include BookData
  include GenreData
  include AlbumData
end