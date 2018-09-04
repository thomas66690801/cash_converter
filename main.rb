require 'terminal-table'
require 'alphavantagerb'
require 'io/console' # this module allow us to read user input char by char. 
require_relative 'lib/Functions' 
require_relative 'lib/Forex'

def clear
    system("clear")
end

clear

user_input = '' #just creating the var
while true
    clear
    array = ["Foreign Currency Exchange","About"]
    Functions.menu_generator(array)
    puts
    puts "Press Q to quit"

    user_input = STDIN.getch #this method read user input char by char
    case user_input
    when '1'        
        Forex.forex
    when '2'
        clear
        puts"""
            Currency Tracker (just a random name) was created by:

            Diego Rodriguez & Thomas Lawrence

            Please check the documentation at: (git hub page)


            Press Enter to return to main menu. 
        """
        gets 
    when 'q' || 'Q' 
        exit    # exit command kills the program in the console. 
    end
end 