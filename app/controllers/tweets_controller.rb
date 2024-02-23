class TweetsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tweet, only: [:edit, :update, :destroy]
  
    def index
        @tweets = Tweet.includes(:user).all
    end    

    def show
    @tweet = Tweet.find(params[:id])
    
    end

    def new
        @tweet = Tweet.new
   end
  
   def create
    @tweet = current_user.tweets.build(tweet_params)
  
    if @tweet.save
      # Check if images are present in the params and attach them to the tweet
      if tweet_params[:images].present?
        tweet_params[:images].each do |image|
          @tweet.image.attach(image)
        end
      end
      redirect_to tweets_path, notice: 'Tweet was successfully created.' # Redirect to index page
    else
      # If the tweet fails to save, render the new form again with errors
      render :new
    end
  end
  
    def edit
    end
  
    def update
        @tweet = Tweet.find(params[:id])
        
        if @tweet.update(tweet_params)
          if params[:tweet][:image].present?
            @tweet.image.attach(params[:tweet][:image])
          end
          redirect_to tweets_path, notice: 'Tweet was successfully updated.'
        else
          render :edit
        end
    end
      
      

  
   def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully deleted." }
      format.json { head :no_content }
    end
  end
  
  
    private
  
    def set_tweet
      @tweet = current_user.tweets.find(params[:id])
    end
  
    def tweet_params
        params.require(:tweet).permit(:title, :content, :message, :image, :video)
    end
  end
  