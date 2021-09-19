require 'pg'
class Bookmarks
  attr_reader :id, :title, :url

  def initialize( id:, title:, url:)
    @id = id 
    @title = title
    @url = url
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    data_from_table = connection.exec( "SELECT * FROM bookmarks;" )
    data_from_table.map do |item|
      Bookmarks.new(
        url: item['url'], 
        title: item['title'], 
        id: item['id']
      )
    end
  end 
  
  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
     item = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1,$2) RETURNING id, url, title;", [url, title]).first
      Bookmarks.new( url: item['url'], title: item['title'], id: item['id'] )
  end

end
