require 'date'
require_relative '../logic/entities/genre'
require_relative '../logic/entities/music_album'

describe MusicAlbum do
  before :each do
    genre = Genre.new(25, 'Pop')
    @album = MusicAlbum.new(991, Date.new(1979, 0o7, 0o3), on_spotify: true)
    @album.add_genre(genre)
  end

  describe '#new' do
    it 'should be able to be created' do
      expect(@album).to be_instance_of(MusicAlbum)
    end

    it 'should have the genre "Pop" associated' do
      expect(@album.genre).to be_instance_of(Genre)
      expect(@album.genre.name).to eq('Pop')
    end

    it 'should generate & save the id of the new music album' do
      expect(@album.id).to eq(991)
    end

    it 'should save the publish date of the new album' do
      expect(@album.publish_date).to eq(Date.new(1979, 0o7, 0o3))
    end
  end

  describe '#can_be_archived?' do
    context 'when the publish date is more than 10 years' do
      it 'should return true' do
        expect(@album.can_be_archived?).to eq(true)
      end
    end

    context 'if album is available on Spotify' do
      it 'should return true' do
        expect(@album.can_be_archived?).to eq(true)
      end
    end
  end

  describe '#move_to_archive' do
    context 'when the album can be archived' do
      it '@archived property should be true' do
        @album.move_to_archive
        expect(@album.archived).to eq(true)
      end
    end
  end
end
