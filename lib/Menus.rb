module Menus
    
    def self.main_menu
        system("clear")

        user_input = '' #just creating the var
        while true
            system("clear")     
            array = ["Foreign Currency Exchange","About"]
            Functions.menu_generator(array)
            puts
            puts "Press Q to quit"    
            user_input = STDIN.getch #this method read user input char by char
            case user_input
            when '1'        
                self.forex
            when '2'
                self.about_display

            when 'q' || 'Q' 
                exit    # exit command kills the program in the console. 
            end
        end 
    end

    def self.about_display
        system("clear")
                
        puts"""
            Currency Tracker (just a random name) was created by:

            Diego Rodriguez & Thomas Lawrence

            Please check the documentation at: (git hub page)


            Press Enter to return to main menu. 
        """
        gets 
    
    end


    def self.forex
        user_options = []
        
        while true
            system("clear")
            puts "Foreign Currency Exchange"
            puts ""
            # aud_usd = self.extract_rate ("USD")
            menu_options = ["USD", "NZD", "EURO", "GBP"]
            Functions.menu_generator(menu_options)
            puts
            puts "Choose your currency by pressing the numbers, when finished, press N for next step"
            puts "Press X to go to previous menu"
            user_input = ''
            user_input = STDIN.getch

            case user_input
            when 'x' || 'X'
                self.main_menu                
            when 'n' || 'N'
                puts user_options
                gets
            when '1'
                user_options.push("USD") 
            when '2'    
                user_options.push("NZD")
            when '3'
                user_options.push("EUR")
            when '4'
                user_options.push("GBP")
            end

        end


        # rows = []
        # rows << ['AUD', 1]
        # rows << ['USD', aud_usd]
        # # rows << ['EUR', aud_eur]
        # # # rows << ['GBP', aud_gbp]
        # # rows << ['NZD', aud_nzd]
        # table = Terminal::Table.new :rows => rows
        # table = Terminal::Table.new :headings => ['CURRENCY', 'EXCHANGE'], :rows => rows    
        # puts " " 
        # puts "Default Currency: AUD"
        # puts table
        # menu_options2 = ["Rate Board"]
        gets
    end

    


end