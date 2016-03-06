require 'PG'
class Bookmark 

attr_reader :name, :address, :id

  def initialize( options )
    @id = nil || options['id']
    @name = options['name']
    @address = options['address']
  end

  def save
    sql = "INSERT INTO bookmarks (
      name, 
      address ) VALUES (
        '#{ @name }',
        '#{ @address }'
      )"
    Bookmark.run_sql( sql )
  end

  def self.all
    sql = "SELECT * FROM bookmarks"
    bookmarks = Bookmark.run_sql(sql )
    result = bookmarks.map { |bookmark| Bookmark.new( bookmark ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM bookmarks WHERE id=#{id}"
    bookmark = Bookmark.run_sql( sql )
    result = Bookmark.new(bookmark[0] )
    return result
  end

  def self.update( options )
      sql = "UPDATE bookmarks 
      SET 
      name = '#{options['name']}',
      address = '#{options['address']}'
      WHERE id = '#{options['id']}'"
      Bookmark.run_sql( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM bookmarks WHERE id = #{id}"
    Bookmark.run_sql( sql )
  end


private 

  def self.run_sql( sql )
    begin
      db = PG.connect( { dbname: 'website', host: 'localhost' } )
      result = db.exec( sql )
      return result
    ensure
      db.close
    end
  end 

end