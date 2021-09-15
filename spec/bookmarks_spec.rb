require 'bookmarks'

describe Bookmarks do
   
  describe '.all' do 
    it 'will return an array' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to include('http://www.makersacademy.com/')
      expect(bookmarks).to include('http://www.google.com/')
      expect(bookmarks).to include('http://www.destroyallsoftware.com/')
    end 
  end 
end

 