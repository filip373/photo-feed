module FlickrHelper
  def authenticate
    FlickRaw.api_key = ENV['key']
    FlickRaw.shared_secret = ENV['secret']
  end

  def user_id(username)
    flickr.people.findByUsername(username: username).id
  end

  def user_photos(user_id, photo_count = 12)
    flickr.people.getPhotos(user_id: user_id, per_page: photo_count)
  end

  def user_name(user_id)
    flickr.people.getInfo(user_id: user_id).username
  end

  # def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
  #   begin
  #     photos = user_photos(user_id, photo_count).in_groups_of(2)
  #     render :partial => '/flickr/sidebar_widget', :locals => { photos: photos }
  #   rescue Exception
  #     render :partial => '/flickr/unavailable'
  #   end
  # end
end
