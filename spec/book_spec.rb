require 'date'
require_relative '../logic/entities/label'
require_relative '../logic/entities/book'

describe Book do
  before :each do
    label = Label.new(1, 'New', 'Green')
    @book = Book.new(1, Date.new(2020, 9, 15), 'Peter James', 'good')
    @book.add_label(label)
  end

  describe '#new' do
    it 'should be able to be created' do
      expect(@book).to be_instance_of(Book)
    end

    it 'should have the label: New, associated' do
      expect(@book.label).to be_instance_of(Label)
      expect(@book.label.id).to eq(1)
      expect(@book.label.title).to eq('New')
      expect(@book.label.color).to eq('Green')
    end

    it 'should save the id of the new book' do
      expect(@book.id).to eq(1)
    end

    it 'should save the publish date of the new book' do
      expect(@book.publish_date).to eq(Date.new(2020, 9, 15))
    end

    it 'should save the publisher of the new book' do
      expect(@book.publisher).to eq('Peter James')
    end

    it 'should save the cover state of the new book' do
      expect(@book.cover_state).to eq('good')
    end
  end

  describe '#can_be_archived?' do
    context 'when the publish date is newer than 10 years' do
      it 'should return false' do
        expect(@book.can_be_archived?).to eq(false)
      end
    end

    context 'when the cover state is good' do
      it 'should return false' do
        expect(@book.can_be_archived?).to eq(false)
      end
    end

    context 'when the publish date is older than 10 years' do
      it 'should return true' do
        @book.publish_date = Date.new(2010, 9, 15)
        expect(@book.can_be_archived?).to eq(true)
      end
    end

    context 'when the cover state is bad' do
      it 'should return true' do
        @book.publish_date = Date.new(2020, 9, 15)
        @book.cover_state = 'bad'
        expect(@book.can_be_archived?).to eq(true)
      end
    end
  end

  describe '#move_to_archive' do
    context 'when the book cannot be archived' do
      it '@archived property should be false' do
        @book.move_to_archive
        expect(@book.archived).to eq(false)
      end
    end

    context 'when the book can be archived' do
      it '@archived property should be true' do
        @book.cover_state = 'bad'
        @book.move_to_archive
        expect(@book.archived).to eq(true)
      end
    end
  end
end
