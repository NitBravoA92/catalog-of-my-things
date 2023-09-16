require_relative 'data/albums'
require_relative 'data/genres'
require_relative 'data/label_data'
require_relative 'data/book_data'
require_relative 'data/games_data'
require_relative 'data/authors_data'

module DataManager
  include GenreData
  include AlbumData
  include LabelData
  include BookData
  include GamesData
  include AuthorData
end
