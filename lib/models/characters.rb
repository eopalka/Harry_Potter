class Characters


    attr_accessor :name, :house, :ancestry, :patronus

    @@all = []

    def initialize(name, house, ancestry, patronus)
        @name = name
        @house = house
        @ancestry = ancestry
        @patronus = patronus
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.random_house
        house = self.all.sample
        if house.house == ""
           house = self.random_house
        end
        house
    end

    # def self.random_number
    #     number = (0..(self.all.length - 1)).to_a
    #     number.sample
    # end

    def self.by_house(house)
        self.all.select do |character|
            character.house == house
        end
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