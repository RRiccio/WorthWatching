require "open-uri"

class Movie < ActiveRecord::Base
  def self.fetch
    @movies = open("http://filmacosapi.herokuapp.com/movies").read
    @movies = JSON.parse(@movies)["movies"]
  end
end