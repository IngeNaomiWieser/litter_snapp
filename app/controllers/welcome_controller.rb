class WelcomeController < ApplicationController
  def index

  end

  def about
  end

  def map
    @user_location = current_user.location if user_signed_in?
    #have a function that checks if a user is logged in. If yes, it sets an instance variable to the location (lat and long) of the user.
    # then in your view file you will have to add the markers to the instance variable
    @litters = Litter.where(cleaned: false)
  end
