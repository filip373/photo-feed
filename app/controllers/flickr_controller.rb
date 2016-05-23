class FlickrController < ApplicationController
  include FlickrHelper

  def index
    authenticate
    @name = params[:username]
    id = user_id(@name)
    @photos = user_photos(id)
  end
end
