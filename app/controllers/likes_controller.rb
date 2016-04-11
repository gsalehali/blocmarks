class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like
    if like.save
     flash[:notice] = "Bookmark has been added to liked bookmakrs"
     redirect_to @bookmark
    else
     flash[:error] = "Error adding bookmark to liked bookmarks"
     redirect_to @bookmark
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find_by(bookmark_id: @bookmark.id)

    authorize like
    if like.destroy
     flash[:notice] = "Bookamr has been removed from liked bookmarks"
     redirect_to @bookmark
    else
     flash[:error] = "Error removing bookmark form liked bookmarks"
     reidrect_to @bookmark
    end
  end
end
