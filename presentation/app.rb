require_relative '../logic/entities/music_album'
require_relative '../logic/entities/genre'
require_relative '../logic/entities/label'
require_relative '../logic/entities/book'
require_relative '../logic/user_interact'

class App
  attr_accessor :albums, :genre

  def initialize
    @books = []
    @authors = []
    @albums = []
    @genres = []
    @labels = []
    @u_interact = UserInteract.new
  end

  def list_books
    puts "\nBook List:"
    if @books.empty?
      puts 'No books available'
      return nil
    end

    @books.each_with_index do |book, idx|
      puts "#{idx}) " \
           "ID: #{book.id}, " \
           "Label: #{book.label.title}, " \
           "Publish Date: #{book.publish_date}, " \
           "Publisher: #{book.publisher}, " \
           "Cover State: #{book.cover_state}"
    end
  end

  def list_authors
    puts 'Authors list'
    if @authors.empty?
      puts 'No authors available'
      return nil
    end

    @authors.each_with_index do |author, index|
      puts "#{index}, " \
           "ID: #{author.id}", \
           "Name: #{author.first_name}, " \
           "Last name: #{author.last_name}, "
    end
  end

  def list_labels
    puts "\nLabel List:"
    if @labels.empty?
      puts 'No Labels available'
      return nil
    end

    @labels.each_with_index do |label, idx|
      puts "#{idx}) " \
           "ID: #{label.id}, " \
           "Title: #{label.title}, " \
           "Color: #{label.color}, "
    end
  end

  def add_label
    new_label
    puts 'Label created successfully'
  end

  def new_label
    id = Random.rand(1..10_000)
    title = @u_interact.title
    color = @u_interact.color

    label = Label.new(id, title, color)
    @labels << label

    label
  end

  def add_book
    new_book
    puts "Book created successfully\n"
  end

  def new_book
    id = Random.rand(1..10_000)
    publish_date = @u_interact.publish_date
    publisher = @u_interact.publisher
    cover_state = @u_interact.cover_state
    label = nil

    if @labels.empty?
      label = new_label
    else
      list_labels
      label_option_selected = @u_interact.select_label
      if %w[n N].include?(label_option_selected)
        label = new_label
      else
        label_index = label_option_selected.to_i
        label = @labels[label_index]
      end
    end

    book = Book.new(id, publish_date, publisher, cover_state)
    book.add_label(label)
    @books << book
  end

  def add_album
    id = Random.rand(1..10_000)
    publish_date = @u_interact.publish_date
    on_spotify = @u_interact.on_spotify?
    genre = select_genre
    album = MusicAlbum.new(id, publish_date, on_spotify: on_spotify)
    album.add_genre(genre)
    @albums.push(album)
  end

  def add_genre
    id = Random.rand(1..20)
    name = @u_interact.add_genre
    genre = Genre.new(id, name)
    @genres.push(genre)
    genre
  end

  def select_genre
    genre = nil
    option = nil

    if @genres == []
      genre = add_genre
    else
      puts 'Select a Gener by selecting (index), or press (n) if you need to add a new one'
      list_genres
      option = @u_interact.select_genre
    end

    if %w[n N].include?(option)
      genre = add_genre
    else
      option = option.to_i
      genre = @genres[option]
    end
    genre
  end

  def list_albums
    puts 'Music Albums list: '
    if @albums.empty?
      puts 'No Music Albums in your catalog yet'
      return nil
    end

    @albums.each_with_index do |album, idx|
      puts "\n #{idx}) ID: (#{album.id})" \
           "- Publish Date: #{album.publish_date} - Genre: #{album.genre.name} " \
           "- Is available on Spotify: #{album.on_spotify}"
    end
  end

  def list_genres
    puts 'Genres List:'
    if @genres.empty?
      puts 'No Genres available yet'
      return nil
    end

    @genres.each_with_index do |genre, idx|
      puts "\n #{idx}) ID: (#{genre.id}) Genre: #{genre.name}"
    end
  end
end
