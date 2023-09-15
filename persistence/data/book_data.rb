require_relative '../file_manager'

module BookData
  FILENAME = 'books.json'

  include FileManager

  def read_all_books(labels)
    data = read_file(file(FILENAME))
    data.map { |book|  json_to_book(book, labels.find { |item| book["label"]["id"] == item.id }) }
  end

  def save_book(books)
    data = books.map { |book| book_to_json(book) }
    write_file(file(FILENAME), data)
  end

  def book_to_json(book)
    { 
      id: book.id, 
      publish_date: book.publish_date, 
      publisher: book.publisher,
      cover_state: book.cover_state,
      label: { id: book.label.id, title: book.label.title, color: book.label.color }
    }
  end

  def json_to_book(book_json, label)
    book = Book.new(book_json['id'], book_json['publish_date'], book_json['publisher'], book_json['cover_state'])
    book.add_label(label)
    book
  end
end
