require 'date'
require_relative '../logic/entities/label'
require_relative '../logic/entities/book'

describe Label do
  before :each do
    @label = Label.new(1, 'Gift', 'Blue')
    @first_book = Book.new(1, Date.new(2020, 9, 15), 'Frank Lenz', 'bad')
  end

  describe '#new' do
    it 'should be able to be created' do
      expect(@label).to be_instance_of(Label)
    end

    it 'should save the id of the new label' do
      expect(@label.id).to eq(1)
    end

    it 'should save the title of the new label' do
      expect(@label.title).to eq('Gift')
    end

    it 'should save the color of the new label' do
      expect(@label.color).to eq('Blue')
    end

    it 'should have the property: @items as an empty array' do
      expect(@label.items).to eq([])
    end
  end

  describe '#add_item' do
    context 'when a new Item is created' do
      it 'it should be added to the @items array' do
        @label.add_item(@first_book)
        expect(@label.items.length).to eq(1)
        expect(@label.items[0]).to eq(@first_book)
      end

      it 'should have the new label saved in the label property' do
        @label.add_item(@first_book)
        expect(@label.items[0].label).to eq(@label)
      end
    end
  end
end
