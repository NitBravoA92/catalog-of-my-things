require 'json'

module DataManager
  def write_data(item_to_save, album_file)
     json_file = JSON.generate(item_to_save)
      File.write(album_file, json_file)
  end

  def read_data
    file = File.read('./persistence/files/albums.json')
    read_data = JSON.parse(file)
  end
end
