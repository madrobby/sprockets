require "test_helper"
require "enumerator"

class SourceFileTest < Test::Unit::TestCase
  def setup
    @environment = environment_for_fixtures
  end
  
  def test_each_source_line
    source_file_lines = Enumerable::Enumerator.new(source_file("src/foo/bar.js"), :each_source_line).to_a
    assert_equal content_of_fixture("src/foo/bar.js"), source_file_lines.map { |line| line.line }.join
    assert_equal 4, source_file_lines.length
  end
  
  def test_find_should_return_pathname_for_file_relative_to_the_current_pathname
    assert_absolute_location_ends_with "test/fixtures/src/foo/bar.js", source_file("src/foo/foo.js").find("bar.js")
  end
  
  def test_find_should_return_nil_for_nonexistent_file
    assert_nil source_file("src/foo/foo.js").find("nonexistent.js")
  end
  
  def test_equality_of_source_files
    assert_equal source_file("src/foo/foo.js"), source_file("src/foo/foo.js")
    assert_equal source_file("src/foo/foo.js"), source_file("src/foo/../foo/foo.js")
    assert_not_equal source_file("src/foo/foo.js"), source_file("src/foo.js")
    assert_not_equal source_file("src/foo/foo.js"), source_file("src/foo/bar.js")
  end
end
