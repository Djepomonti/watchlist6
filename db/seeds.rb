require 'open-uri'
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts 'Destroy database...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

puts 'Creation de base de donnée...'

response['results'].each do |movie|

  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
end

puts 'New database created!'
