require_relative 'presentation/menu'

def start
  puts "\n"
  puts 'Welcome to your Catalog Manager!'

  puts ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
  puts ',,,,,,,,,,,,,,;cooo:,,,,,,,,,;:lool;,,,,,,,,,,,,,,'
  puts ',,,,,,,,,,,,,l0XKO0Kkc,,,,,,ckK0OKX0o;,,,,,,,,,,,,'
  puts ',,,,,,,,,,,;dXWKl,;oKKo;,,,lKKd:,c0WNx;,,,,,,,,,,,'
  puts ',,,,,,,,,,,oXWWO:,,,l0Xd;;oKKl,,,;kWWNd;,,,,,,,,,,'
  puts ',,,,,,,,,,lKKKWO:,,,,c0X00X0l,,,,;OWKKKl,,,,,,,,,,'
  puts ',,,,,,,,,;kNdoXXl,,,,,lKMWXo,,,,,cKNdoXO:,,,,,,,,,'
  puts ',,,,,,,,,oX0::ONk;,,,;dXNNXx;,,,;xN0c:OXd,,,,,,,,,'
  puts ',,,,,,,,;kNx,,oXXo,,;xXKocxXx:,,lKNd,,dNO:,,,,,,,,'
  puts ',,,,,,,,lK0c,,;xN0:;xXOc,,;dKk::ONO:,,:0Ko,,,,,,,,'
  puts ',,,,,,,,dNk;,,,cON00Xk:,,;,,l000N0c,,,;kNx,,,,,,,,'
  puts ',,,,,,,,xNk;,,,,dNMWk;,,,,,,,lKMNx;,,,,dNk;,,,,,,,'
  puts ',,,,,,,,dNk;,;cxKK0XKx:,,,,;lOK0KXkc;,;xNx;,,,,,,,'
  puts ',,,,,,,,:OXkdOK0xc;ckKKOxdxO0kl,,d0KOxkKOc,,,,,,,,'
  puts ',,,,,,,,,:odxdl;,,,,,coxxxxoc,,,,,,ldxxo,,,,,,,,,,'
  puts ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'

  run = Menu.new
  run.menu_options
end

start
