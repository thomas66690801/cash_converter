module Forex

    def self.extract_rate currency
        client = Alphavantage::Client.new key: ENV.fetch('KEY')

        exchange = client.exchange from: "AUD", to: currency 
        exchange = Alphavantage::Exchange.new from: "AUD", to: currency, key: ENV.fetch('KEY')
        
        exchange_rates = exchange.hash["Realtime Currency Exchange Rate"]
        result = exchange_rates["5. Exchange Rate"]
        return result
    end

    def self.forex
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
        aud_usd = self.extract_rate ("USD")
    
        # aud_eur = .extract_rate ("EUR")
    
        # aud_gbp = .extract_rate ("GBP")
    
        # aud_nzd = .extract_rate ("NZD")
        rows = []
        rows << ['AUD', 1]
        rows << ['USD', aud_usd]
        # rows << ['EUR', aud_eur]
        # # rows << ['GBP', aud_gbp]
        # rows << ['NZD', aud_nzd]
        table = Terminal::Table.new :rows => rows
        table = Terminal::Table.new :headings => ['CURRENCY', 'EXCHANGE'], :rows => rows    
        puts " " 
        puts "Default Currency: AUD"
        puts table
        # menu_options2 = ["Rate Board"]
        gets
    end
        




end
