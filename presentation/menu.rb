require_relative 'sub_menu'

class Menu
  def initialize
    @sub_menu = SubMenu.new
  end

  def menu_options
    puts 'Welcome to your Catalog Manager!'
    puts "\n"
    puts '1 - List all books'
    puts '2 - List all Albums'
    puts '3 - List all Games'
    puts '4 - Add a book'
    puts '5 - Add an Album'
    puts '6 - Add a Game'
    puts '7 - Exit'
    puts "\n"
    option_selected
  end

  def option_selected
    puts 'Select your option'
    option = gets.chomp.to_i
    @sub_menu.sub_menu(option)
  end
end
