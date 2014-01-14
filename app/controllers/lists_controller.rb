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
        @list = List.find_by_name(params[:list_name].gsub('_', ' '))

    end

end
