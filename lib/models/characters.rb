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

    def self.by_house(house)
        self.all.select do |character|
            character.house == house
        end
    end

end