class Api::V1::UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end     

    # def create
    #     user = User.new()
    # end    

    def show
        user = User.find(params[:id])
        render json: user
    end     





    private 

    def user_params(*args)
        params.require(:user).permit(*args)
    end     
    
end 