class Characters


    attr_accessor :name, :house, :ansestry, :patronus

    @@all = []

    def initialize(name, house, ansestry, patronus)
        self.name = ["name"]
        self.house = data["house"]
        self.ansestry = data["ansestry"]
        self.patronus = data["patronus"]
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.house_mates
    #     @@house_mates
    # end

    # def self.sort_data
    #     @@house_mates = self.all.map {|name| name.house}.uniq
    # end

    # def self.retrieve_by_house(house)
    #     selected_house = self.all.filter{|name| name.house == house}
    #     selected_house.map{|name| name.name}
    # end

    # def self.retrieve_ansestry(name)
    #     found_name = self.all.find{|name| name.name == name}
    #     found_name.ansestry
    # end

    # def self.retrieve_patronus(name)
    #     found_name = self.all.find{|name| name.name == name}
    #     found_name.patronus
    # end



end