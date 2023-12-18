class HomeController < ApplicationController
  require 'httparty'

  def home
    response = HTTParty.get('https://v2.jokeapi.dev/joke/Programming?blacklistFlags=nsfw,racist,sexist,explicit&type=twopart') 
    if response.code == 200
      @random = JSON.parse(response.body)
      if @random['type'] == 'twopart'
        @randomsetup = @random['setup']
        @randomdelivery = @random['delivery']
      end
    else
      # Handle error here, provide a fallback setup and delivery
      @randomsetup = "Why don't programmers like nature?"
      @randomdelivery = "It has too many bugs."
    end
  end
end


