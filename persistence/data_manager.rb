require_relative 'data/label_data'
require_relative 'data/book_data'
require_relative 'data/games_data'
require_relative 'data/authors_data'

module DataManager
  include LabelData
  include BookData
  include GamesData
  include AuthorData
end
