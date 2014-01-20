module SearchList

    def includes? string, word
        if string != nil
            string.to_s.downcase.include? word.to_s.downcase
        else
            false
        end
    end

    def searching array, search
        result = []
        array.each do |item|
            score = 0
            search.split.each do |word|
                score += 1 if includes?(item.title, word)  ||
                            includes?(item.director, word)  ||
                            includes?(item.froms, word)  ||
                            includes?(item.recommended_by, word)  ||
                            includes?(item.notes, word)  ||
                            includes?(item.notes2, word)  ||
                            includes?(item.genre, word)  ||
                            includes?(item.language, word)  ||
                            includes?(item.year, word)
            end
            if score == search.split.length
                result << item
            end
        end
        result
    end

end