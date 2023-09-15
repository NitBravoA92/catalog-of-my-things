require 'json'

module FileManager
  DIRECTORY = './persistence/files/'.freeze

  def file(filename)
    "#{DIRECTORY}/#{filename}" # full path of the given file
  end

  def read_file(file)
    return [] unless File.exist?(file)

    JSON.parse(File.read(file))
  end

  def write_file(file, data)
    File.write(file, JSON.pretty_generate(data))
  end
end
