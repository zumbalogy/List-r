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

    def item
        #enter title, then take you to fill
    end

    def fill
        #fill out autopoped form then submit
        @title = params[:title]
        link_title = @title.gsub(' ','+')
        party = HTTParty.get("http://www.omdbapi.com/?i=&t=#{link_title}")
        hash = JSON.parse(party)

        @year = hash['Year']
       # @


    end

    def submit
        #need to catch and save the item
        @list = List.find_by_name(params[:list].gsub('_', ' '))
        redirect_to "/list/#{@list.name.gsub(' ','_')}"
    end


end
