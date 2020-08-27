
require 'net/http'
require 'open-uri'
require 'json'
require 'rest-client'

require 'pry'
class Api
    attr_accessor :id, :name, :desc
    key = "CW3HtIO"
    #BASEURL = "strainapi.evanbusse.com/#{key}"
    # def get_desc_url(id)
    #     key = "CW3HtIO"
    # # BASE = "strainapi.evanbusse.com/#{key}"
    #     url  = "strainapi.evanbusse.com/CW3HtIO/strains/data/desc/#{id}"
    #     binding.pry
    #     #BASE = "strainapi.evanbusse.com/#{key}"
    #     #url = "#{BASE}/strains/data/desc/#{strain_id}"
    #     response = RestClient.get(url)
    #     results = JSON.parse(response)
    #     description = results["desc"]
    #     #The above would return the description which will be a paragraph 
    # end 
    BASE_URL = "strainapi.evanbusse.com/#{key}"
    API_KEY = "CW3HtIO"
    def self.query_effects
        key = "CW3HtIO"
        url = "strainapi.evanbusse.com/#{key}/searchdata/effects"
        response = RestClient.get(url)
        results = JSON.parse(response)
        effects = results 
        # all_effects = effects.collect do |effect|
        #     effect.each do |k,v| 
        #         puts "#{v}"
        #     end 
        # end 
        all_effects = effects.collect do |effect|
            effect.each do |k,v| 
                puts "#{v}"
            end 
        end 
        
    end 
    def initialize 
        hash = query_strains_by_effect("headache")
        test_method(hash)

    end 
    
    def test_method(hash) 
        
        hash.each do |k,v|
            self.send("#{k}=", v) if self.respond_to? (k)
        end 
        # @@all << self 

    end 
   
    def query_strains_by_effect(effect) # this is going to be user input !!!! the arg will be user input # still undecided about querying all effects and then letting that be input options 
        key = "CW3HtIO"
        url = "strainapi.evanbusse.com/#{key}/strains/search/effect/#{effect}"
        response = RestClient.get(url)
        results = JSON.parse(response)
        
        tenders_strain = results.shuffle.first
    
        hash = {"id"=>"" , "name"=>"", "desc"=>""}
        hash["id"] = tenders_strain["id"]
        hash["name"] = tenders_strain["name"]
        id = hash["id"]
        hash[:desc] = query_description_by_id(("#{id}").to_i)
        hash 
         
       


        #query_description(pull)
        # binding.pry
        # results.each do |r|
        #     Strain.new(r)
        # end 
        # binding.pry
        # resulting_strain = results.shuffle.first
        #maybe set the properties(id and name here????) of the strain instance here?!?!?!!?!?!!!?!?!?!???
        # strain_id = resulting_strain["id"] #would return the id 2150
        # strain_name = resulting_strain["name"] 
        # strain_description = query_description(strain_id) 
        # puts "ID NO. #{strain_id}, Strain Name: #{strain_name}, Description: #{strain_description}"
        # "ID NO. #{strain_id}, Strain Name: #{strain_name}, Description: #{strain_description}"
        
    end 
    def query_description_by_id(id)

        key = "CW3HtIO"
        url  = "strainapi.evanbusse.com/CW3HtIO/strains/data/desc/#{id}"
        #binding.pry
        response = RestClient.get(url)
        results = JSON.parse(response)
        description = results["desc"]
        #The above would return the description which will be a paragraph 
    end 
        #maybe somewhere between these steps 
        #resulting_strain_strain_selected["name"] = would return the name Yoda OG 
        #It should puts out the strain name and the strain id 
        #random strain selected now go ahead and pull id and strain name 
    # Take the strain ID that is returned from the hash and use it set description to the 
    # return of the the get_desc_url method 
    # def fetch_by_effect(effect)

    #     key = "CW3HtIO"

    #     # here you should probably do base URl and then have the data url called for the data 
    #     BASEURL = "strainapi.evanbusse.com/#{key}"
    #     def get_desc_url(strain_id)
    #         url = "#{BASEURL}/strains/data/desc/#{strain_id}"
    #         response = RestClient.get(BASEURL)
    #         results = JSON.parse(response)
    #     end 

    #     url = "strainapi.evanbusse.com/#{key}/strains/search/effect/#{effect}"
    #     # desc_url = should this be the description URL?? or should I just interpolate for the extra 
    #     #data 
    #     response = RestClient.get(url)
    #     results = JSON.parse(response)
    #     binding.pry
    #     resulting_strain_strain_selected = results.shuffle.first
    #     #maybe set the properties(id and name here????) of the strain instance here?!?!?!!?!?!!!?!?!?!???
    #     #resulting_strain_strain_selected["id"] = would return the id 2150
    #     #maybe somewhere between these steps 
    #     #resulting_strain_strain_selected["name"] = would return the name Yoda OG 
    #     #It should puts out the strain name and the strain id 
    #     #random strain selected now go ahead and pull id and strain name 


        
    # end

    # def fetch_by_id(strain_id)
    #     #take in the strain id and make the call using that strain ID 
    #     key = "CW3HtIO"

    #     url = "strainapi.evanbusse.com/#{key}/strains/data/desc/#{strain_id}"
    #     binding.pry
    #     response = RestClient.get(url)
    #     JSON.parse(response)

    # end 
end 

# api = API.new
# api.fetch_by_effect("relaxed")
api = Api.new 
api
binding.pry
