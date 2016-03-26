require "link_thumbnailer"

class Bookmark < ActiveRecord::Base
  belongs_to :topic

  def thumbnail
    obj = LinkThumbnailer.generate(url)
    obj.images.first.src.to_s
  end

  def title
    obj = LinkThumbnailer.generate(url)
    obj.title
  end

  def description(url)
    obj = LinkThumbnailer.generate(url)
    obj.description
  end
end
