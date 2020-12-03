class Cli 

    def start
        puts "Welcome to Hogwarts School of Witchcraft and Wizardry!"
        puts "Time to be sorted into your house."
        programs = Api.get_programs #all info loaded and models created at this point
        json_data = Api.new.json_parse(programs)
        sorting_hat_menu
    end

    def sorting_hat_menu
        puts "Sorting Hat: 'Hmmmm....quite tricky this one. It'll have to be....Gryffindor!'"
        main_menu
    end

    def main_menu
        puts "Congratulations! Would you like to meet your house mates? Type Yes or No"
        character_menu
    end

    def character_menu
        input = get_input

        if input == "Yes"
            puts "Here they come now..."
            list_characters
       elsif input == "No"
            puts "Well I'm sure you will meet them all soon enough, now it's time for the feast to begin!"
       else
            invalid_choice
            main_menu
       end
    end
         
    def invalid_choice
        puts "Not even magic could decipher what you meant by that, could you try again."
    end

    def get_input
        print "Enter Choice: "
        gets.chomp
    end 

    def list_characters
        # Characters.new(json_data)
        Characters.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}"
        end
    end






    # def exit_menu
    #     response = $prompt.select("Would you like to meet some more?", ["Yes", "No"])
    #     if response == "Yes"
    #         display_character_menu
    #     elsif
    #         response == "No"
    #     elsif
    #         exit_menu
    #     end
    # end





end