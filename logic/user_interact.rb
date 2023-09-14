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
    string_date = "#{year}-#{month}-#{day}"
    publish_date = Date.parse(string_date)
  end

  def on_spotify?
    puts 'Is your album on Spotify (Y/N)?'
    input = gets.chomp
    toCapitalLetter = input.capitalize
    true if toCapitalLetter == 'Y'
  end
end
