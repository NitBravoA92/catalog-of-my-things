require_relative '../logic/entities/music_album'
require_relative '../logic/entities/genre'
require_relative '../logic/entities/label'
require_relative '../logic/entities/book'
require_relative '../logic/user_interact'
require_relative '../logic/checkdata'
require_relative '../persistence/data_manager'

class App
  include DataManager

  attr_accessor :albums, :genre

  def initialize
    @books = []
    @authors = []
    @games = []
    @albums = []
    @genres = []
    @labels = get_all_labels
    @u_interact = UserInteract.new
    @check = CheckData.new
  end

  def list_books
    @check.check_list_books(@books)
  end

  def list_authors
    @check.check_list_authors(@authors)
  end

  def list_games
    @check.check_list_games(@games)
  end

  def list_labels
    @check.check_list_labels(@labels)
  end

  def list_albums
    @check.check_list_albums(@albums)
  end

  def list_genres
    @check.check_list_genres(@genres)
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

  def save_all_on_exit
    save_label(@labels) unless @labels.empty?
  end
end
