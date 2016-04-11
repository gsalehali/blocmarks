class LikePolicy < ApplicationPolicy
  def create?
    user.present? && !user.bookmarks.find_by(id: record.bookmark)
  end
end