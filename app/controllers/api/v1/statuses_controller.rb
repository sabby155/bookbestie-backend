class Api::V1::StatusesController < ApplicationController

    def index 
        statuses = Status.all 
        render json: statuses
    end
    
    def create 
        user_id = params[:userId]
        book_id = params[:bookId]
        wishlist = params[:wishlist]
        favorite = params[:favorite]
        read = params[:read]

        # book = Card.find(params[:bookId])

        status = Status.find_or_create_by(
            user_id: user_id, 
            card_id: book_id, 
            wishlist: wishlist, 
            favorite: favorite,
            read: read,
            # book: book
        )

        if status
            render json: status
        else 
            render json: {errors: "Unsuccessful"}    
        end     
    end   
    
    def update 
        status = Status.find(params[:id])
        status.update(
            user_id: user_id, 
            card_id: book_id, 
            wishlist: wishlist, 
            favorite: favorite,
            read: read,
            )
        render json: status
    end 


    # create seperate functions for wishlist, read and favorites that show only the books under that status 

    # def wishlist 
    #     wishes = Status.select do |status|
    #         status.wishlist == true
    #     end 
    #     render json: wishes    
    # end   
    
    # def reads
    #     read = Status.select do |status|
    #         status.read == true
    #     end 
    #     render json: read    
    # end 

    # def favorites
    #     faves = Status.select do |status|
    #         status.favorite == true
    #     end 
    #     render json: faves    
    # end 
    
    

end 