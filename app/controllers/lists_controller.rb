class NilClass
    def gsub input, input2
        nil
    end
end




class ListsController < ApplicationController

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

    def search
        @where = 'search'
        @list = List.find_by_name(params[:list_name].gsub('_', ' ')) || List.find_by_name(params[:list])
        search = params[:search]
        @array = searching(@list.items, search)
    end



    def create
        list = List.new
        list.name = params[:name]
        list.user_id = params[:user_id]
        list.save
        redirect_to '/'
    end

    def show
        @list2 = List.find_by_name(params[:list_name].gsub('_', ' ')) || List.find_by_name(params[:list])
        @array = []
        Item.all.each do |x|
            if x.recommended_by == ''
                x.recommended_by = nil
                x.save
            end
        end
        ordered = Item.order(params[:order_by] || 'title')
        ordered.all.each do |x|
            if x.list_id == @list2.id
                @array << x
            end
        end
        @where = 'main'

    end


    def seen_order
        @array = []
        @list = List.find_by_name(params[:list_name].gsub('_', ' ')) || List.find_by_name(params[:list])
        ordered = Item.order(params[:order_by] || 'title')
        ordered.all.each do |x|
            if x.list_id == @list.id
                @array << x
            end
        end
        @where = 'seen'
    end




    def fill
        @title = params[:title]
        link_title = @title.gsub(' ','+')
        party = HTTParty.get("http://www.omdbapi.com/?i=&t=#{link_title}")
        hash = JSON.parse(party)
        @year = hash['Year']
        @director = hash['Director']
        @genre = hash['Genre']
        @language = hash['Language']
    end

    def submit
        #need to catch and save the item
        @list = List.find_by_name(params[:list].gsub('_', ' '))

        item = Item.new
        item.title = params[:title]
        item.director = params[:director]
        item.year = params[:year]
        item.genre = params[:genre]
        item.language = params[:language]
        item.title = params[:title]
        item.list_id = @list.id

        item.notes = params[:notes]
        item.notes2 = params[:notes2]
        item.recommended_by = params[:recommended_by]
        item.froms = params[:from]
        item.save

        redirect_to "/list/#{@list.name.gsub(' ','_')}"
    end

    def kill_item
        @list = List.find_by_name(params[:list_name].gsub('_',' '))
        item = Item.find(params[:item_id])
        item.delete
        redirect_to "/list/#{@list.name.gsub(' ','_')}"
    end

    def seen_item
        @list = List.find_by_name(params[:list_name].gsub('_',' '))
        item = Item.find(params[:item_id])
        item.seen = true
        item.save
        redirect_to "/list/#{@list.name.gsub(' ','_')}"
    end

    def unsee_item
        @list = List.find_by_name(params[:list_name].gsub('_',' '))
        item = Item.find(params[:item_id])
        item.seen = false
        item.save
        redirect_to "/list/#{@list.name.gsub(' ','_')}/seen/title" 
    end

    def delete
        list = List.find(params[:id])
        list.delete
        redirect_to '/'
    end

    def csv
        @items = List.find_by_name(params[:list_name].gsub('_',' ')).items
        @where = 'csv'

    end




end
