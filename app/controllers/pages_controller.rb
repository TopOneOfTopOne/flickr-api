class PagesController < ApplicationController
  def index
  end

  def search
    begin
      photos = get_photos(user_id[:search_user_id])
      @photos_urls = parse_photos(photos)
      render 'index'
    rescue
      flash.now[:notice] = "No such user_id in flickr database :("
      render 'index'
    end
  end

  def random
    @photos_urls = parse_photos(flickr.photos.getRecent)
    render 'index'
  end

  private

  def user_id
    params.require(:search).permit(:search_user_id)
  end
end
