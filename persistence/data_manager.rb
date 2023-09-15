require_relative 'data/label_data'
require_relative 'data/book_data'
require_relative 'data/games_data'

module DataManager
  include LabelData
  include BookData
  include GamesData
end
