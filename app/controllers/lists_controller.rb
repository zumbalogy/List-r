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

end
