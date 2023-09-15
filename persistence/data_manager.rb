require_relative 'data/label_data'
require_relative 'data/book_data'

module DataManager
  include LabelData
  include BookData
end
