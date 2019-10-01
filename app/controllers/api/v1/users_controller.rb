class Api::V1::UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end     

    # # def login
    # #     user = User.find()
    #     add login
    # # end   
    
    def create 
        user = User.new(
            username: params[:username],
            password: params[:password]
        )
        if user.save
            render json: user
        else 
            render json: {errors: user.errors.full_messages}
        end     
    end     

    def show
        user = User.find(params[:id])
        render json: user
    end     





    private 

    def user_params(*args)
        params.require(:user).permit(*args)
    end     
    
end 