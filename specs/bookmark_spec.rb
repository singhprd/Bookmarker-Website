require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/bookmark'

class BookmarkTest < MiniTest::Test

  def setup
    params = {'name' => 'Google', 'address' => 'www.google.com'}
    @bookmark = Bookmark.new( params )
  end

  def test_name
    assert_equal( 'Google', @bookmark.name )
  end

  def test_bookmark
    assert_equal( 'www.google.com', @bookmark.address)
  end

end