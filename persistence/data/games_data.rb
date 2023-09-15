require_relative '../file_manager'

module GamesData
  FILENAME = 'games.json'.freeze

  include FileManager

  def parsedatajson(games)
    {
      id: games.id,
      publish_date: games.publish_date,
      multiplayer: games.multiplayer,
      last_played_at: games.last_played_at
    }
  end

  def parsedatagame(data_json)
    Game.new(data_json['id'], data_json['publish_date'], data_json['multiplayer'], data_json['last_played_at'])
  end

  def read_games
    data = read_file(file(FILENAME))
    data.map { |items| parsedatagame(items) }
  end

  def save_games(games)
    data = games.map { |items| parsedatajson(items) }
    write_file(file(FILENAME), data)
  end
end
