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
      title = self.title || obj.title 
      description = self.description || obj.description
      self.update_columns(thumbnail: thumbnail, title: title, description: description)
      puts "Finished generating thumbanil and title"
    rescue 
      false
    end
  end

  validates :url, presence: true
  validates :url, format: {with: URI.regexp}, if: 'url.present?'

end
