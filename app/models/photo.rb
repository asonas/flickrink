class Photo < ActiveRecord::Base

  validates_uniqueness_of :flickr_photo_id

  def self.fetch_photos_for_flickr(page:)
    FlickRaw.api_key = Rails.application.secrets.flickr_api_key
    FlickRaw.shared_secret = Rails.application.secrets.flickr_api_secret

    args = {}
    args[:tags] = "kosenconf"
    args[:media] = "photos"
    args[:per_page] = 500

    args[:page] = page
    discovered_pictures = flickr.photos.search args
    last_page = !discovered_pictures.any?
    puts last_page
    puts discovered_pictures.count

    discovered_pictures.each do |p|
      next unless Photo.find_by(flickr_photo_id: p.id).nil?

      photo = flickr.photos.getInfo({ photo_id: p.id })
      url = FlickRaw.url p;

      puts "create record: ", photo.id
      puts url

      self.create(
        flickr_photo_id: photo.id,
        server_id: photo.server,
        rotation: photo.rotation,
        secret: photo.secret,
        owner_id: photo.owner.nsid,
        username: photo.owner.username,
        description: photo.description,
        url: url
      )
    end
  end

end
