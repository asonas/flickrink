class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.where(rotation: 0).sample 9
    gon.ws_host = case Rails.env
    when "production"
      "flickrink.herokuapp.com"
    when "development"
      "localhost:3000"
    end
  end

  def replace
    sanitize
    photo = Photo.all.sample

    WebsocketRails[:streaming].trigger "replace", { url: photo.url, username: photo.username, position: params[:position] }

    render json: { message: :success }
  end

  private
    def sanitize
      return nil unless (1..9).include? params[:position].to_i
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:nsid, :username, :description, :url)
    end
end
