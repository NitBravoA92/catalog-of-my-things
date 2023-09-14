require_relative './presentation/menu'

def start
  
  puts "\n"
  puts 'Welcome to your Catalog Manager!'
  puts "\n"
  
  run = Menu.new
  run.menu_options
end  

start
