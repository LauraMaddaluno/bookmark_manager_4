require 'bookmarks'

describe Bookmarks do
  
  describe '.all' do 
    it 'will return the list of bookmarks' do
      #Connect to the database
      #connection = PG.connect(dbname: 'bookmark_manager_test')
      #Insert data
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmarks.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmarks.create(url: "http://www.google.com", title: "Google")
   
      bookmarks = Bookmarks.all
   
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
     end
   end
  
  describe '.create' do 
    it 'create a new bookmarks' do
      bookmark = Bookmarks.create(url: 'https://www.youtube.com/', title: "YOUTUBE")
      expect(bookmark.url).to eq 'https://www.youtube.com/'
      expect(bookmark.title).to eq 'YOUTUBE'
    end
  end

end

 