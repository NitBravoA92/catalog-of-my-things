class CheckData
  def check_list_books(books)
    puts "\nBook List:"
    if books.empty?
      puts 'No books available'
      return nil
    end

    books.each_with_index do |book, idx|
      puts "#{idx}) " \
           "ID: #{book.id}, " \
           "Label: #{book.label.title}, " \
           "Publish Date: #{book.publish_date}, " \
           "Publisher: #{book.publisher}, " \
           "Cover State: #{book.cover_state}"
    end
  end

  def check_list_authors(authors)
    puts 'Authors list'
    if authors.empty?
      puts 'No authors available'
      return nil
    end

    authors.each_with_index do |author, index|
      puts "#{index}) " \
           "ID: #{author.id}," \
           "Name: #{author.first_name}," \
           "Last name: #{author.last_name},"
    end
  end

  def check_list_games(games)
    puts 'Games List'
    if games.empty?
      puts 'No games available'
      return nil
    end
    games.each_with_index do |game, index|
      puts "#{index}) " \
           "ID: #{game.id}, " \
           "Publish date: #{game.publish_date}, " \
           "Multiplayer: #{game.multiplayer}, " \
           "Last played: #{game.last_played_at}, "
    end
  end

  def check_list_labels(labels)
    puts "\nLabel List:"
    if labels.empty?
      puts 'No Labels available'
      return nil
    end

    labels.each_with_index do |label, idx|
      puts "#{idx}) " \
           "ID: #{label.id}, " \
           "Title: #{label.title}, " \
           "Color: #{label.color}, "
    end
  end

  def check_list_albums(albums)
    puts 'Music Albums list: '
    if albums.empty?
      puts 'No Music Albums in your catalog yet'
      return nil
    end

    albums.each_with_index do |album, idx|
      puts "\n #{idx}) ID: (#{album.id})" \
           "- Publish Date: #{album.publish_date} - Genre: #{album.genre.name} " \
           "- Is available on Spotify: #{album.on_spotify}"
    end
  end

  def check_list_genres(genres)
    puts 'Genres List:'
    if genres.empty?
      puts 'No Genres available yet'
      return nil
    end

    genres.each_with_index do |genre, idx|
      puts "\n #{idx}) ID: (#{genre.id}) Genre: #{genre.name}"
    end
  end
end
