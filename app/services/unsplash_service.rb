class UnsplashService
  def initialize
    Unsplash.configure do |config|
      config.application_access_key = ENV['UNSPLASH_ACCESS_KEY']
      config.application_secret = ENV['UNSPLASH_SECRET_ACCESS_KEY']
      config.application_redirect_uri = "http://localhost:3000/oauth/callback"
      config.utm_source = "kitten"
    end
  end
  def search_images(query, per_page)
    search_results = Unsplash::Photo.search(query,0, per_page)
    search_results.map do |image|
      image.urls.regular
    end
  end

end


