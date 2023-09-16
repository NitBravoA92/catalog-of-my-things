require 'date'
require_relative '../logic/entities/genre'
require_relative '../logic/entities/music_album.rb'

describe Genre do
  before :each do
    @genre = Genre.new(10, 'ProgRock')
    @album = MusicAlbum.new(1, Date.new(1980, 05, 25), on_spotify: false)
  end

  describe '#new' do
    it 'should be able to be created' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'should save the id of the new genre' do
      expect(@genre.id).to eq(10)
    end

    it 'should save the Name of the Genre' do
      expect(@genre.name).to eq('ProgRock')
    end

    it 'should have the property: @items as an empty array' do
      expect(@genre.items).to eq([])
    end
  end

  describe '#add_item' do
    context 'when a new Item is created' do
      it 'it should be added to the @items array' do
        @genre.add_item(@album)
        expect(@genre.items.length).to eq(1)
        expect(@genre.items[0]).to eq(@album)
      end
    end
  end
end
