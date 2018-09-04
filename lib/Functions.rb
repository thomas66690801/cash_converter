module Functions
    def Functions.menu_generator(array)
        array.each_with_index do |value, index|
          puts "#{index +1} #{value}"    
        end
    end


end

