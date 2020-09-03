require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    attributes = { title: "Parasite", director: "Bong Joon-ho" }
    movie = Movie.create(attributes)
    # As a user,
    # when I visit /movies/1
    visit("/movies/#{movie.id}") # visit("/movies/1")
    # I see the title of the movie "Parasite"
    assert_text movie.title
    # I also see the name of the director "Bong Joon-ho"
    assert_text movie.director
  end

  test "visiting the index" do
    movie_1 = Movie.create(title: "Parasite", director: "Bong Joon-ho")
    movie_2 = Movie.create(title: "Titanic", director: "James Cameron")

    visit("/movies") # visit("/movies/1")

    assert_text movie_1.title
    assert_text movie_1.director

    assert_text movie_2.title
    assert_text movie_2.director
  end

  test "creating a new movie" do
    # As a user,
    #   When I visit "/movies",
    #   I see a link/button to add a new movie.
    visit "/movies"

    assert_button "Add New Movie"

    click_button "Add New Movie"
    #   When I click on "Add New Movie",

    assert_current_path "/movies/new"
    #   I am on a new page,

    assert_selector ".new_movie"
    #   and I see a form to add a new movie.
    #
    fill_in :movie_title, with: "Drop Dead Fred"
    fill_in :movie_director, with: "Ilana Corson"
    fill_in :movie_year, with: "1992"

    click_on "Add Movie"
    #   I fill in the title, director name and year
    #   I click "Add Movie",
    assert_text "Drop Dead Fred"
    assert_text "Ilana Corson"
    assert_text "1992"
    #   and I am redirected to the page for that movie,
    #   and I see the title, director name and year.
  end

  test "edit a movie" do
    movie = Movie.create(title: "Jumanji", director: "Ilana Corson", year: "2017")

    visit "/movies/#{movie.id}"

    assert_button "Edit #{movie.title}"

    click_button "Edit #{movie.title}"

    assert_current_path "/movies/#{movie.id}/edit"

    assert_selector ".edit_movie"
    
    fill_in :movie_year, with: "2019"

    click_on "Update Movie"

    assert_text "2019"
    assert_no_text "2017"
  end
end
