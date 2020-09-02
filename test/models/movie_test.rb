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
    refute movie.valid?
  end

  test "movies titles only are returned" do
    Movie.create(title: "Jumanji")
    Movie.create(title: "Jumanji_2")
    Movie.create(title: "Jumanji_3")

    assert_equal ["Jumanji", "Jumanji_2", "Jumanji_3"], Movie.by_title
  end

  test "movies descending facebook_likes" do
    movie_1 = Movie.create(title: "jumanji", facebook_likes: 6)
    movie_2 = Movie.create(title: "Jumanji_2", facebook_likes: 2)
    movie_3 = Movie.create(title: "jumanji 3", facebook_likes: 60)

    assert_equal [movie_3, movie_1, movie_2], Movie.most_to_least_fb_likes
  end

  test "movie year by title" do
    movie_1 = Movie.create(title: "tumanji", facebook_likes: 6, year: "2005")

    assert_equal "2005", Movie.year_by_title("tumanji")
  end

  test "movies with more than x fb likes" do
    movie_1 = Movie.create(title: "jumanji", facebook_likes: 90)
    movie_2 = Movie.create(title: "jumanji 2", facebook_likes: 6)
    movie_3 = Movie.create(title: "jumanji 3", facebook_likes: 44)
    movie_4 = Movie.create(title: "jumanji 4", facebook_likes: 43)

    assert_equal [movie_1, movie_3], Movie.more_fb_likes_than(43)
  end

end
