require 'pg'
class Bookmarks
  def self.all 
    connection = PG.connect( dbname: 'bookmark_manager' )
    data_from_table = connection.exec( "SELECT * FROM bookmarks;" )
    data_from_table.map do |item|
      item['url']
    end
  end 
end
