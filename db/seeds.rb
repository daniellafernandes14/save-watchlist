require 'open-uri'
require 'json'

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=b44a49fa3c13f437fed16591556e3ea0'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
movies = user['results']

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all

puts "Creating lists.."

romance = List.create(
  name: "Romance",
  photo_url: "https://api.time.com/wp-content/uploads/2020/02/best-romantic-movies-on-netflix.jpg"
)
action = List.create(
  name: "Action",
  photo_url: "https://www.skillsetmag.com/wp-content/uploads/sites/14/2020/10/80saction1.jpg"
)
comedy = List.create(
  name: "Comedy",
  photo_url: "https://www.watchmojo.com/uploads/blipthumbs/Fi-M-Top10-Comedy-Films-of-the-2010s-480p30.jpg"
)
sci_fi = List.create(
  name: "Sci-Fi",
  photo_url: "https://cdn.onebauer.media/one/media/5ece/bf26/1175/9fcb/d1d6/6dc5/main-2001.jpg?format=jpg&quality=80&width=440&ratio=16-9&resize=aspectfill"
)
war = List.create(
  name: "War",
  photo_url: "https://www.indiewire.com/wp-content/uploads/2017/07/hacksaw-ridge.jpg"
)
western = List.create(
  name: "Western",
  photo_url: "https://cdn.theatlantic.com/thumbor/HwTKESvZeXHElhDlO4DM-RCoyWw=/0x42:1673x983/960x540/media/img/mt/2016/10/the_searchers_original1/original.jpg"
)
history = List.create(
  name: "Historical",
  photo_url: "https://media.vogue.fr/photos/5fe271bb6c7c8589350baac8/master/pass/076_CHL_008908.jpg"
)
doc = List.create(
  name: "Docs",
  photo_url: "https://assets.vogue.com/photos/5a01e4ee8d94e07477278c3a/master/w_3000,h_1688,c_limit/05-best-documentaries.jpg"
)
thriller = List.create(
  name: "Thriller",
  photo_url: "https://images.indianexpress.com/2020/05/shutter-island-759.jpg"
)

lists = [romance, action, comedy, sci_fi, war, western, history, doc, thriller]
lists.each do |list|
  puts "#{list.name} is in the DB!"
end

puts "Creating movies..."

movies.each do |movie|
  movie = Movie.create(
    title: movie['title'],
    year: movie['release_date'],
    description: movie['overview'],
    rating: movie['vote_average'],
    movie_image: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  )
  puts "#{movie.title} is in the DB!"
end
