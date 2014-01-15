class ListsController < ApplicationController
    def new
    end

    def create
        list = List.new
        list.name = params[:name]
        list.user_id = params[:user_id]
        list.save

        redirect_to '/'
    end

    def show
        @list = List.find_by_name(params[:list_name].gsub('_', ' ')) || List.find_by_name(params[:list])
    end

    def seen
        @list = List.find_by_name(params[:list_name].gsub('_', ' ')) || List.find_by_name(params[:list])
    end



    def item
        #enter title, then take you to fill
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
        item.where = params[:from]
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
        redirect_to "/list/#{@list.name.gsub(' ','_')}/seen" 
    end

    def delete
        list = List.find(params[:id])
        list.delete
    
    redirect_to '/'
    end



end
