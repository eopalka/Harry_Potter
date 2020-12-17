class Characters

    attr_accessor :name, :house, :ancestry, :patronus

    @@all = [] #stores all my characters instances

    # .new will automatically this method 
    def initialize(name, house, ancestry, patronus)
        @name = name
        @house = house
        @ancestry = ancestry
        @patronus = patronus
        @@all << self # the instance you just created 
    end

    def self.all 
        @@all
    end
    
    def self.random_house #uses .sample, array class method that randomizes the return
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