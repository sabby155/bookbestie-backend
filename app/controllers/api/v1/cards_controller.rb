class Api::V1::CardsController < ApplicationController

    def index 
        cards = Card.all
        render json: cards

    end 

    # def show 
    #     card = Card.find(params[:id])
    #     render json: card
    # end     

    
    def search 
        term = params[:search].split.join("+")
        url = "https://www.googleapis.com/books/v1/volumes?q=#{term}&maxResults=10"
        response = RestClient.get(url)
        data = JSON.parse(response)
        items = data["items"]
        created_cards = items.map do |book|
            Card.find_or_create_by(
            title: book["volumeInfo"]["title"],
            authors: book["volumeInfo"]["authors"],
            description: book["volumeInfo"]["description"],
            published_date: book["volumeInfo"]["publishedDate"],
            page_count: book["volumeInfo"]["pageCount"],
            image_url: book["volumeInfo"]["imageLinks"]["thumbnail"]
            )
           
        end     

        render json: created_cards 

    end  
  
    
    
end
