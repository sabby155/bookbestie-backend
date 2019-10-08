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
        term = params[:search].split.join("%20")
        url = "https://www.googleapis.com/books/v1/volumes?q=#{term}&maxResults=10"
        response = RestClient.get(url)
        data = JSON.parse(response)
        items = data["items"]
        created_cards = items.map do |book|
            Card.find_or_create_by(    
            title: book["volumeInfo"]["title"],
            authors: book["volumeInfo"]["authors"].join(", "),
            description: book["volumeInfo"]["description"].mb_chars.limit(700) + ' [...]',
            published_date: book["volumeInfo"]["publishedDate"],
            page_count: book["volumeInfo"]["pageCount"],
            image_url: book["volumeInfo"]["imageLinks"]["thumbnail"],
            genre: book["volumeInfo"]["categories"],
            rating: book["volumeInfo"]["averageRating"],
            ratings_count: book["volumeInfo"]["ratingsCount"],
            )
           
        end     

        render json: created_cards 

    end  

    def bestsellers
        url = "https://api.nytimes.com/svc/books/v3/lists.json?list=Combined%20Print%20and%20E-Book%20Fiction&api-key=LCJKr95EkrIk7PbzTeMCNjE7BmPaNGS6"
        response = RestClient.get(url)
        data = JSON.parse(response)
        results = data["results"]
        bestsellers_cards = results.map do |book|
            Card.find_or_create_by(
            title: book["book_details"][0]["title"],
            authors: book["book_details"][0]["author"],
            description: book["book_details"][0]["description"],
            published_date: book["published_date"],
            isbn: book["isbns"][1]["isbn10"],
            rating: book["rank"],
            ratings_count: 1,
            )
        end
        render json: bestsellers_cards

    end 
  
    # page_count: "null",
    #         image_url: "null",
    #         genre: "null",
    
end
