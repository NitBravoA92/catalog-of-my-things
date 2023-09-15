require_relative '../logic/user_interact'
require_relative 'app'
require_relative '../persistence/data/albums'

class Menu
  attr_accessor :data

  def initialize
    @data = UserInteract.new
    @app = App.new
  end

  def menu_options
    puts "\n"
    menu = { 1 => 'List all books',
             2 => 'List all music albums',
             3 => 'List all movies',
             4 => 'List all genres',
             5 => 'List all Labels',
             6 => 'List all authors',
             7 => 'Add a book',
             8 => 'Add a music album',
             9 => 'Add a movie',
             10 => 'Exit' }

    menu.each do |key, value|
      puts "#{key}: #{value}"
    end

    sub_menu(@data.option)
  end

  def sub_menu(option)
    case option
    when 1
      @app.save_on_exit
    when 2
      @app.list_albums
    when 3
      @app.add_album
    when 7
      exit
    end
    menu_options
  end
end
