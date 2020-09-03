class Review
    #our intermediary - ie single source of truth
    
    @@all = [] #class variable of all the reviews
    attr_accessor :rating #getter & setter - can change after init
    attr_reader :viewer, :movie #getter, not setter - can't change after init
    #Review#rating = get method for rating (above)
    #Review#viewer = get method for viewer (above)
    #Rewview#movie = get method for movie (above)

    def initialize(viewer, movie, rating)
        @viewer = viewer
        @movie = movie
        @rating = rating
        @@all.push(self) #same as a shovel - adding review to array of all reviews
    end

    def self.all #self.method = class method, not instance method
        @@all #basically a getter for our array of all reviews
    end

end
