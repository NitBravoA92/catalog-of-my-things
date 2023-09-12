require_relative './presentation/menu'

def index
  menu = Menu.new()
  menu.menu_options
end  

index
