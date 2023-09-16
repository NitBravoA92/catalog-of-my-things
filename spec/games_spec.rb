require 'date'
require_relative '../logic/entities/author.rb'
require_relative '../logic/entities/game.rb'

describe Game do
    before :each do
      author = Author.new(2001, 'Pepe', 'Pecas')
      @games = Game.new(3001, Date.new(2000, 5, 1), true, Date.new(2023, 2, 21))
      @games.add_author(author)
    end

    describe '#new' do
        it 'should be able to be created' do
          expect(@games).to be_instance_of(Game)
        end

        it 'should have the author: New, associated' do
            expect(@games.author.id).to eq(2001)
            expect(@games.author.first_name).to eq('Pepe')
        end

        it 'should save the publish date of the new game' do
            expect(@games.publish_date).to eq(Date.new(2000, 5, 1))
        end
    end
    
    describe '#can_be_archived?' do
        context 'when the publish date is newer than 10 years' do
            it 'should return false' do
            expect(@games.can_be_archived?).to eq(false)
            end
        end
    end  
end    