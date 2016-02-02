require 'open-uri'

class Downloader

  def get url
    image = []
    open(url) do | data |
      image = data.read
    end
  end

end
