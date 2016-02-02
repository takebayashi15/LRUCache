require './downloader.rb'
require './lru.rb'

class ImageCache

  def initialize
    @lru = LRUCache.new 10
    @downloader = Downloader.new
  end

  def get url
    unless @lru.get url
      #download from internet
      puts "DOWNLOAD => "+url
      @lru.put(url, @downloader.get(url))
    else
      #reference from memory (do nothing)
      puts "REFERENCE"
    end
    @lru.get url
  end

  def to_s
    @lru.to_s
  end

end
