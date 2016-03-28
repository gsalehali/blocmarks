require "link_thumbnailer"

class Bookmark < ActiveRecord::Base
  after_save :add_thumbnail_and_title

  belongs_to :topic 

  private

  def add_thumbnail_and_title
    begin
      puts "Strated generating thumbanil and title"
      obj = LinkThumbnailer.generate(url)
      thumbnail = obj.images.first.src.to_s
      title = obj.title 
      self.update_columns(thumbnail: thumbnail, title: title)
      puts "Finished generating thumbanil and title"
    rescue 
      false
    end
  end

end
