require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  before(:all) do
    if Movie.where(director: "Jon Favreau").empty?
      Movie.create(title: "Iron Man", director: "Jon Favreau",
                   rating: "PG-13", release_date: "2008-05-02")
      Movie.create(title: "Spider-Man: Homecoming", director: "Jon Favreau",
                   rating: "PG-13", release_date: "2017-07-07")
    end

    if Movie.where(title: "Big Hero 6").empty?
      Movie.create(title: "Big Hero 6",
                   rating: "PG", release_date: "2014-11-07")
    end
  end

  ##### Part 3 #####
  # Write your tests here
  # describe "my feature" do
  describe "create method" do
    it "creates a movie" do
      Movie.create(title: "Iron Man 2", director: "Jon Favreau",
                   rating: "PG-13", release_date: "20010-05-02")

      # movie = Movie.find_by_title("Iron Man")
      # other_movies = movie.others_by_same_director()
      expect(Movie.where(title: "Iron Man 2").length).to eq 1
      # expect(other_movies).to include(Movie.find_by_title("Spider-Man: Homecoming"))
    end
  end

  # describe "delete method" do
  #   it "deletes a movie" do
  #     movie = Movie.where(title: "Big Hero 6")
  #     # movie = Movie.find_by_title("Iron Man")
  #     # other_movies = movie.others_by_same_director()
  #     expect(Movie.where(title: "Big Hero 6").length).to eq 0
  #     # expect(other_movies).to include(Movie.find_by_title("Spider-Man: Homecoming"))
  #   end
  # end
end
