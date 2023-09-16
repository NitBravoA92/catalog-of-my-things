require 'date'
require_relative '../logic/entities/author'
require_relative '../logic/entities/game'

describe Author do
  before :each do
    @author = Author.new(2001, 'Pepe', 'Pecas')
    @games = Game.new(3001, Date.new(2000, 5, 1), true, Date.new(2000, 5, 1))
  end

  describe '#new' do
    it 'Should initialize class' do
      expect(@author).to be_instance_of(Author)
    end

    it 'Should save the name of the new author' do
      expect(@author.first_name).to eq('Pepe')
    end
  end

  describe '#add_item' do
    context 'when a new Item is created' do
      it 'it should be added to the @items array' do
        @author.add_item(@games)
        expect(@author.items.length).to eq(1)
        expect(@author.items[0]).to eq(@games)
      end
    end
  end
end
