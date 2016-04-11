class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  def full_name
    return "#{first_name} #{last_name}"
  end

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
