
require 'net/http'
require 'open-uri'
require 'json'
require 'rest-client'

require 'pry' 
class CliProject001::Strain
    # attr_accessor :flavor :strain_id, :desc
    attr_accessor :name, :id, #:strain_desc
    def initialize(arg)
        method call: 
        args.each do |k,v|
            self.send("#{k}=", v) if self.respond_to? (k)
        end 
        @@all << self 

    end 
    def initialize(arg)
        
        args.each do |k,v|
            self.send("#{k}=", v) if self.respond_to? (k)
        end 
        @@all << self 

    end 
    @@all = []


    def rating=(rating)
        #this rating property will be equal to "not yet rated" if no rating has been set. The rating should
        # have a new value of a number 1..5 that will be the new value of the rating property once set 
        #
    end 
    #there will probably be five arrays of all the strains grouped by rating and all those strains will be
    #retrievable by a rating entered. 
    # An strain object can have a status of tried, a strain desc, a strain id and a strain name, 
    # and a rating
    def find_all_by_rating(rating) #takes in an arg of a rating and returns all strains by their name
    end 
    def rating 
        @rating
    end 
   
    def rate 
        #rate is a method that will rate the strain from 1-5 and upon rating give it gives its 
        #rate property a value that is then readable. if no rating is set puts "not yet rated"
        # maybe add in a notes property that sets that user input to a value on a property not yet set. 
        #if no notes have been written it should puts/ return "no notes for this strain"
    end 
    def save 
        self.class.all << self 
    end 
    def self.all 
        @@all 
    end 

    feelings = ["Relaxed", "Euphoric", "Creative", "Energetic", "Happy"]
    #Have a method that will iterate over and return all strains with that effect 
    #If the user would like to get a description of the strain, have a method that can do that 
    #If the user would like to get flavors associated with that strain, have a method that can also do that. 

    def desc(strain_id)
        #puts out a description of that strain based on strain id 
    end 
    def flavor(strain_id)
        #puts out flavor info for that strain based on strain ID 
    end 
end 