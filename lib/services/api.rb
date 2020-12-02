

class Api
    
  def self.base_url
    "http://hp-api.herokuapp.com/api/characters/house"
  end

  def self.load_data
    load_characters
  end


  def self.load_characters
    response = RestClient.get(base_url + '/gryffindor')
    data = JSON.parse(response.body)
    data["results"].each do |character_data|
      Characters.new(character_data)
    end
    
  end
  
end
  
  # URL = "http://hp-api.herokuapp.com/api/characters/house/gryffindor"
  #   def get_programs
  #     uri = URI.parse(URL)
  #     response = Net::HTTP.get_response(uri)
  #     response.body
  #   end
  # end
  
  # programs = Api.new.get_programs
  # puts programs



  #     #URL = "http://hp-api.herokuapp.com/api/characters/house/#{house_name}"

#    house_name = ["1. Gryffindor", "2. Slytherin", "3. Hufflepuff", "4. Ravenclaw"]
#http://hp-api.herokuapp.com/api/characters/house/gryffindor
#http://hp-api.herokuapp.com/api/characters/house/slytherin
#http://hp-api.herokuapp.com/api/characters/house/hufflepuff
#http://hp-api.herokuapp.com/api/characters/house/ravenclaw