require_relative 'menu'

class SubMenu

  def sub_menu(option)
    case option
    when 1
      puts 'Here you have the list of all books'
    when 2
      puts 'Here you have the list of all albums'
    when 3
      puts 'Here you have the list of all games'
    when 4  
      puts 'Please give the detail of your new book'
    when 5
      puts 'Please insert the details of your new album'  
    when 6
      puts 'Please insert the details of your new game'
    when 7
      puts "I'll be back!!"
      exit    
    end
  end
end