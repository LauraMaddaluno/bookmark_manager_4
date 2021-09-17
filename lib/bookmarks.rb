require 'pg'
class Bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    data_from_table = connection.exec( "SELECT * FROM bookmarks;" )
    data_from_table.map do |item|
      item['url']
    end
  end 
  
end
