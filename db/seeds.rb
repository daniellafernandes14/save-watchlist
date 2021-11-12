require 'open-uri'
require 'json'

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=b44a49fa3c13f437fed16591556e3ea0'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
movies = user['results']

movies.each do |movie|
  movie = Movie.create(
    title: movie['title'],
    year: movie['release_date'],
    description: movie['overview'],
    rating: movie['vote_average'],
    movie_image: "https://image.tmdb.org/t/p/w500#{movie['poster_url']}"
  )
  puts "#{movie.title} is in the DB!"
end
