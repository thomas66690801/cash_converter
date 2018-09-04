module Forex

    def self.extract_rate currency
        client = Alphavantage::Client.new key: ENV.fetch('KEY')

        exchange = client.exchange from: "AUD", to: currency 
        exchange = Alphavantage::Exchange.new from: "AUD", to: currency, key: ENV.fetch('KEY')
        
        exchange_rates = exchange.hash["Realtime Currency Exchange Rate"]
        result = exchange_rates["5. Exchange Rate"]
        return result
    end

        




end
