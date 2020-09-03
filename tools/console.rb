# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#defining viewers
conrad = Viewer.new("Conrad")
madeline = Viewer.new("Madeline")
adam = Viewer.new("Adam")

#defining movies
the_godfather = Movie.new("The Godfather")
jaws = Movie.new("Jaws")
mortal_kombat = Movie.new("Mortal Kombat")

#defining pre-done reviews
review1 = Review.new(conrad, the_godfather, 3)
review2 = Review.new(adam, the_godfather, 3)
review3 = Review.new(madeline, the_godfather, 4)

#making some reviews
conrad.rate_movie(jaws, 3)
madeline.rate_movie(mortal_kombat, 1)

#hopefully updating a review
conrad.rate_movie(the_godfather, 4)

#testing other methods
puts the_godfather.reviewers # => conrad, adam, madeline
puts jaws.average_rating # => 3
puts madeline.reviewed_movies # => the_godfather, mortal_kombat
puts conrad.reviewed_movie?(mortal_kombat) # => false
puts adam.reviewed_movie?(the_godfather) # => true
puts Movie.highest_rated # => the_godfather


# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0
