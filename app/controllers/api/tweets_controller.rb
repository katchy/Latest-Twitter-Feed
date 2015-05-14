class Api::TweetsController < ApplicationController
  
  respond_to :json

  def index

      client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "XENBjXIPPSwuyqbcI12qpqW6p"
      config.consumer_secret     = "fHqodXhscGPLsvPQRiAjPyy153Bwjwlk6edFI5yy8a7ueZXh0W"
      config.access_token        = "3070120650-IG3j1velZsFn3vwJp22FQZEKs5oXJqlq0zpWMcm"
      config.access_token_secret = "vtYJMcQ5hTuyKNh55QY7oqaiTM57YnWOZtmC1P27IHBLS"
      end
      result = client.search("to:justinbieber marry me", :result_type => "recent").take(3).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
      end
     
      tweet = client.user_timeline(params[:user]).first.text
      render json: tweet.to_json
  end

end