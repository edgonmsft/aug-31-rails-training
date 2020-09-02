require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie is valid with a title" do
    movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")

    assert_equal "Parasite", movie.title
    assert_equal "Bong Joon-ho", movie.director
    assert movie.valid?
  end

  test "movie is invalid without a title" do
    movie = Movie.create(title: "", director: "Bong Joon-ho")
    # movie 
    refute movie.valid?
  end
end
