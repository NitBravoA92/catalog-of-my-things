require_relative '../file_manager'

module AuthorData
  FILENAME = 'author.json'.freeze

  include FileManager

  def parsedatajson1(authors)
    {
      id: authors.id,
      first_name: authors.first_name,
      last_name: authors.last_name,
      items: authors.items.map(&:id)
    }
  end

  def parsedataauthor(data_json)
    Author.new(data_json['id'], data_json['first_name'], data_json['last_name'])
  end

  def read_authors
    data = read_file(file(FILENAME))
    data.map { |items| parsedataauthor(items) }
  end

  def save_authors(authors)
    data = authors.map { |items| parsedatajson1(items) }
    write_file(file(FILENAME), data)
  end
end
