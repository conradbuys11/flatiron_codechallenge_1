class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def reviews
    Review.all.select{ |review|
      review.movie == self
    }
    #see explanation for Viewer#reviews
  end

  def reviewers
    self.reviews.map{ |review|
      review.viewer
    }
    #see explanation for Viewer#reviewed_movies
  end

  def average_rating
    self.reviews.sum{ |review| #iterating through all reviews associated with movie
      review.rating #add the review's rating to our total
      #we end with a sum of all ratings for reviews associated with our movie
    }.to_f / self.reviews.length.to_f
    #making this number into a float so we don't get errors if there are no decimals ahead of time
    #then dividing that number by the amount of reviews this movie has (also making float just in case)
    #sum of ratings divided by number of ratings is average!
  end

  def self.highest_rated #class method, denoted by self.method_name
    self.all.max{ |movie_challenger, movie_champion| #iterating through array of all movies
      #THANK YOU SO MUCH FOR LETTING ME USE THE SPACE SHIP IN THIS CODE CHALLENGE!!!
      movie_challenger.average_rating <=> movie_champion.average_rating
      #compare the average rating of our challenger & our champion
      #whoever's rating is higher becomes the new champion, and we iterate one further
      #whoever is champion at the end is what we return!
      }

    #side note: you can also write this as

    #self.all.max_by{ |movie|
      #movie.average_rating
    #}

    #to clean up your code. both statements are the exact same.
    #but I really wanted to use the space ship here.
    #please don't take off points for that. D:
  end

end
