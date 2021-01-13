class PigLatinizer

    attr_reader

    def piglatinize(text)
        split_text= text.split(/ /)
        # binding.pry
        array= split_text.map {|word| piglatinize_word(word) }
        return array.join(" ")
        
    end

    def piglatinize_word(word)
        
        downcase_word = word.downcase

        if downcase_word.start_with?("a","e","i","o","u")
            piglatinized_word = downcase_word+ "way"
        else
            split_word = word.split(//)

            consonants = split_word.take_while {|letter| letter != "a" && letter !="e" && letter !="i" && letter !="o" && letter !="u"}
            chopped_word = split_word.drop_while {|letter| letter != "a" && letter !="e" && letter !="i" && letter !="o" && letter !="u"}
            
            
            if consonants.count <= 1 && chopped_word.count == 0
                
                piglatinized_word = consonants.join + "way"
                
            elsif consonants.count > 1
                piglatinized_word = chopped_word.join + consonants.join+ "ay"
            else
                piglatinized_word = chopped_word.join + consonants[0]+ "ay"
            end

        end

        if word.start_with?("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")
            piglatinized_word.capitalize
        else
            piglatinized_word
        end
    end

end