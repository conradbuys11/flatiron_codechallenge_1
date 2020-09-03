class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    self.class.all << self
  end

  def self.all
    @@all
  end

  def reviews
    Review.all.select{ |review| #iterating through all reviews to find something specific
      review.viewer == self #if the review's viewer is us, add to returned array
    }
    #returns array of reviews, specifically that have our instance of viewer
  end

  def reviewed_movies
    self.reviews.map{ |review| #iterating through all the reviews we're associated with
      review.movie #movie in the review we're looking at
    }
    #returns array of movies, specifically the ones in reviews we're associated with
  end

  def reviewed_movie?(movie)
    self.reviewed_movies.any?{ |reviewed_movie| #iterating through all movies we've reviewed
      reviewed_movie == movie #if a reviewed movie is the movie we're looking for, return true
    }
    #any? will check if we returned ANY truths, i.e. 1+ truth will return true.
  end

  def rate_movie(movie, rating)
    if self.reviewed_movie?(movie) #if we've already reviewed this movie
      self.reviews.find{ |review| #iterating through all reviews we're associated with
        review.movie == movie #find the review we're associated with that has this movie
      }.rating = rating #set that review's rating to our new rating
    else #if we haven't already reviewed this movie
      Review.new(self, movie, rating) #define new review with us as the viewer, & our specified movie/rating
    end
  end

end
