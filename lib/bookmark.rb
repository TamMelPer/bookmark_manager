require 'pg'

class Bookmark


  def self.all
    connection = PG.connect :dbname => 'bookmark_manager'
    result = connection.exec "SELECT * from bookmarks"
    result.map { |row| row['url'] }
  end

end
