require 'terminal-table'
require 'alphavantagerb'
require 'io/console' # this module allow us to read user input char by char. 

system ("clear") #this command clears the console 

def menu_generator(array)
array.each_with_index do |value, index|
puts "#{index +1} #{value}"    

end

def extract_rate currency
    client = Alphavantage::Client.new key: ENV.fetch('KEY')

    exchange = client.exchange from: "AUD", to: currency 
    exchange = Alphavantage::Exchange.new from: "AUD", to: currency, key: ENV.fetch('KEY')
    
    exchange_rates = exchange.hash["Realtime Currency Exchange Rate"]
    result = exchange_rates["5. Exchange Rate"]
    return result

end






def forex
    system("clear")
    puts "Foreign Currency Exchange"
    puts ""
    # client = Alphavantage::Client.new key: ENV.fetch('KEY')

    # exchange = client.exchange from: "AUD", to: "USD" 
    # exchange = Alphavantage::Exchange.new from: "AUD", to: "USD", key: ENV.fetch('KEY')
    
    # exchange_rates = exchange.hash["Realtime Currency Exchange Rate"]
    # exchange_rates.each do |key, value|
    #     puts "#{key} : #{value}"
    #  end

    


    


    aud_usd = extract_rate ("USD")

    aud_eur = extract_rate ("EUR")


    rows = []
    rows << ['AUD', 1]
    rows << ['USD', aud_usd]
    rows << ['EUR', aud_eur]
    table = Terminal::Table.new :rows => rows
    table = Terminal::Table.new :headings => ['CURRENCY', 'EXCHANGE'], :rows => rows
    
    puts " " 
    puts "Default Currency: AUD"
    puts table


    # menu_options2 = ["Rate Board"]
    gets

end





end


#infinite loop that will finish when pressed q or Q
user_input = '' #just creating the var
while true
    system ("clear") #clearing the console everytime so it looks nice 
    array = ["Foreign Currency Exchange","About"]

    menu_generator(array)
    puts
    puts "Press Q to quit"



    user_input = STDIN.getch #this method read user input char by char
    case user_input
    when '1'
        
        forex
        

    when '2'
        system("clear")
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