class PagesController < ApplicationController
  def home
     @movies = Movie.fetch
     @rejected_movies, @movies = @movies.partition do |movie|
      movie["rating"].blank? || movie["rating_count"].blank? || movie["rating"] < 7.5 || movie["rating_count"] < 5000
     end
     @movies = @movies.sort_by{|movie| movie["theater_count"]}.reverse
  end
end
