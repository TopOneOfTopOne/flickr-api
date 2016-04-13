class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def get_photos(user_id)
    flickr.photos.search(user_id: user_id)
  end

  # get url from photos and group photo urls in twos for
  # easy display & processing
  def parse_photos(photos)
    photos.map do |photo|
      FlickRaw.url_b(photo)
    end.in_groups_of(2)
  end
end
