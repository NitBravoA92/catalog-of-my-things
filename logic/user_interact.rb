require 'date'

class UserInteract
  def option
    puts "\n"
    puts 'Select your option'
    gets.chomp.to_i
  end

  def publish_date
    puts 'Enter the year of publish'
    year = gets.chomp
    puts 'Enter month in numbers, eg.: 04 for April'
    month = gets.chomp
    puts 'Enter date'
    day = gets.chomp
    Date.parse("#{year}-#{month}-#{day}")
  end

  def on_spotify?
    puts 'Is your album on Spotify (Y/N)?'
    input = gets.chomp
    to_cap_letter = input.capitalize
    true if to_cap_letter == 'Y'
  end

  def add_genre
    puts 'Please write the Music Genre you want to add'
    input = gets.chomp
    input.capitalize
    input
  end

  def select_genre
    gets.chomp
  end
end
