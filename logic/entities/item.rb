require 'date'

class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :label, :source

  def initialize(id, publish_date)
    @id = id
    @publish_date = publish_date
    @archived = false
    @genre = nil
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self)
  end

  def add_label; end

  def add_source; end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    current_date = Date.today
    years = current_date.year - @publish_date.year
    years > 10
  end
end
