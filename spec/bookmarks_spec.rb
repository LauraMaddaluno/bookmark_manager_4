require 'bookmarks'

describe Bookmarks do
  
  describe '.all' do 
    it 'will return the list of bookmarks' do
      #Connect to the database
      connection = PG.connect(dbname: 'bookmark_manager_test')
      #Insert data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com/');")

      #can I get the Data from the database
      bookmarks = Bookmarks.all

      #is this in the database?
      expect(bookmarks).to include('http://www.makersacademy.com/')
      expect(bookmarks).to include('http://www.google.com/')
      expect(bookmarks).to include('http://www.destroyallsoftware.com/')
      expect(bookmarks.size).to eq(3)
    end 
  end 
  describe '.create' do 
    it 'create a new bookmarks' do
      Bookmarks.create(url: 'https://www.youtube.com/')
      expect(Bookmarks.all).to include( 'https://www.youtube.com/' )
    end
  end

end

 