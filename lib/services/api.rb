class Api

    URL = "http://hp-api.herokuapp.com/api/"

    def self.get_programs #Takes api info and calls a parsing method, iterates over data to extract specific character attributes 
      uri = URI.parse(URL + "characters/")
      response = Net::HTTP.get_response(uri)
      data = json_parse(response.body)
      data.each do |character_data|
        Characters.new(character_data["name"], character_data["house"], character_data["ancestry"], character_data["patronus"])
      end
    end

    def self.json_parse(data) #parses from HTML into hashes so Ruby can understand it
      JSON.parse(data)
    end

end