class PigLatinizer

    attr_reader

    # def initialize(text=nil)
    #     if text != nil
    #         @text = text.downcase
    #     end
    # end

    def piglatinize(word)
        # consonants = %w[b c d f g h j k l m n p q r s t v w x y z]
        if word.start_with?("a","e","i","o","u")
            word + "way"
        else
            split_word = word.split(//)

            consonants = split_word.take_while {|letter| letter != "a" && letter !="e" && letter !="i" && letter !="o" && letter !="u"}
            chopped_word = split_word.drop_while {|letter| letter != "a" && letter !="e" && letter !="i" && letter !="o" && letter !="u"}
            
            # binding.pry
            if consonants.count <= 1 && chopped_word.count == 0
                # binding.pry
                piglatinized_word = consonants.join + "way"
                # binding.pry
            elsif consonants.count > 1
                piglatinized_word = chopped_word.join + consonants.join+ "ay"
            else
                piglatinized_word = chopped_word.join + consonants[0]+ "ay"
            end
        end
    end

end