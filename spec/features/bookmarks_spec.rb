require 'pg'
feature 'bookmarks' do 
  scenario 'viewing bookmarks at the /bookmarks route' do
     #Connect to the database
     connection = PG.connect(dbname: 'bookmark_manager_test')
     #Insert data
     connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
     connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
     connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com/');")

     #can I get the Data from the database
    visit ("/bookmarks")
    Bookmarks.create( url: 'http://www.makersacademy.com/' )
    Bookmarks.create( url: 'http://www.google.com/' )
    Bookmarks.create( url: 'http://www.destroyallsoftware.com/' )
  end
end