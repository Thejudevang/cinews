class Api::V1::MoviesController < ApiController

  def index
  	movies = Imdb::Top250.new.movies.first(5).uniq.map do |object|
  	  movie = Imdb::Movie.new(object.id)

  	  {
  	  	id: movie.id,
  	  	title: movie.title,
  	  	cast_members: movie.cast_members,
  	  	poster: movie.poster,
  	  	rating: movie.rating,
  	  	trailer_url: movie.trailer_url
  	  }
  	end

  	render json: movies
  end

end