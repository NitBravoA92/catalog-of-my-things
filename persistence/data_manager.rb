require 'json'

  def write_data(item_to_save, album_file)
     json_file = JSON.generate(item_to_save)
      File.write(album_file, json_file)
    # File.open(album_file, "a") do |f|
    #     f.puts JSON.generate(item_to_save)
    # end        
  end

  def read_data
    # file = File.read('./files/albums.json')
    # read_data = JSON.parse(file)
    # puts read_data
  end
