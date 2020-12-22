class Cli 

    def start
        puts "Welcome to Hogwarts School of Witchcraft and Wizardry!"
        sleep (1)
        puts
        puts "Time to be sorted into your house."
        Api.get_programs #all info loaded and models created at this point
        sorting_hat_menu
    end

    def sorting_hat_menu #assigns random house and sets it to variable to use again in rest of code
        @chosen_house = Characters.random_house 
        puts "Sorting Hat: Hmmmm....quite tricky this one. It'll have to be...."
        sleep (4)
        puts
        puts "#{@chosen_house.house}!"
        puts 
        main_menu
    end

    def main_menu
        puts "Congratulations! Would you like to meet your house mates? Type Yes or No"
        character_menu
    end

    def character_menu
        input = get_input

        if input == "Yes" || input == "yes"
            puts "Here they come now..."
            list_characters
       elsif input == "No" || input == "no"
            exit_time
       else
            invalid_choice
            main_menu
       end
    end
         
    def list_characters
        Characters.by_house(@chosen_house.house).each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}"
        end
        character_details_menu_options
    end

    def character_details_menu_options
        puts "Select house mate's number or name"
        character_details_menu
    end

    def character_details_menu
        input = get_input
        character = Characters.find_by_name(input)
        if character != nil
            print_character_details(character)
            meet_more_menu
        elsif input.to_i.between?(1, Characters.by_house(@chosen_house.house).length) 
            index = input.to_i - 1
            character = Characters.by_house(@chosen_house.house)[index]
            print_character_details(character)
            meet_more_menu
       else
            invalid_choice
            main_menu
       end
    end

    def print_character_details(character)

        puts "I guess I should welcome you to #{character.house}."
        puts "I expect you'll work hard to help us earn the House Cup this year."

        puts "My name is #{character.name} by the way."

        if character.ancestry == ""
            puts "I'm not actually sure of my full ancestry."
        else puts "Well if you must know I am #{character.ancestry}."
        end

        if character.patronus == ""
            puts "Why would you think a wizzard as strong as me needs a patronus? Pathetic."
        else puts "I didn't think you'd ask but my patronus is a #{character.patronus}."
        end
    end

    def meet_more_menu
        puts "Would you like to meet some more? Type Yes or No"
        input = get_input

        if input == "Yes" || input == "yes"
            list_characters
        elsif input == "No" || input == "no"
            exit_time
        else
            invalid_choice
            meet_more_menu
        end
    end
    
    def get_input
        print "Enter Choice: "
        gets.chomp
    end 

    def invalid_choice
        puts "Not even magic could decipher what you meant by that, could you try again."
    end

    def exit_time
        puts "Well I'm sure you will meet them all soon enough, now it's time for the feast to begin!"
        exit
    end

end


# code challenge: print list of characters, in alphabetical order by name attribbute 

    # def alphabetical_names
    #     Characters.by_house(@chosen_house.house).sort_by do |character|
    #         character.name
    #     end 
    # end