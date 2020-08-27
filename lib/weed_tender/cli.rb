class CliProject001::Cli
    
    def start 
        effect = "Relaxed"
        puts "Welcome to your weedtender!!!"
        puts "Pick a desired effect to get served up a strain: #{effect}"
        #puts #menu  #a method that returns an array of effects#array of effects as strings
        menu
    end 

    def menu 
        puts "What effect would you like to search for"
        input = gets.strip
        CliProject001::Api.query_strains_by_effect(input)
        CliProject001::Strain.all.each_with_index(1) do |m, i|
            puts "#{i}. #{m.name}"
        end 
    end 
end 
    
    
    #In here, pick four effects that the user can feel 
#Then call the request with that effect 
# Cli WeedTender app 

# user opens app.
#  WeedTender welcomes the user and asks for a desired feeling. 

# There will only be five positive feelings available. Happy, Relaxed, Euphoric, Energetic, and Creative. 

# Once a feeling is selected, The cli will at random, select a random strain from the data. 

# If the user does not care about description or flavor, they can choose to exit the app and enjoy their weed.


# If the user in interested in description or flavor or both, 
# the user can go ahead find out more info regarding taste and description. 

# A method will be in charge of going ahead and, using the strain ID, retrieving flavor info 
# for the strain and description info for that particular strain, again by strain ID. 
# a strain needs a desc... it also has an id and a name - which are probably also properties 

#a strain can then have things done to it - it can be favorited or disliked - possibly shoveling that 
#strain into a favorites and disliked list. that strain should push along with it its description and 
#properties 
# A strain can also be given a rating. A user should also be able to return the list of 1 star ratings and 
# 2,3,4, and 5 star ratings along with its descriptions 
# strain should probably be an object 