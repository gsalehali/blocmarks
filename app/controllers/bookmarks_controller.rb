class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "bookmarks has been saved"
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Error saving bookmark"
      render :new
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "bookmarks has been saved"
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Error saving bookmark"
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic

    if @bookmark.destroy
      flash[:notice] = "Bookmark has been deleted"
      # redirect_to @topic
    else 
      flash[:error] = "Error deleting topic"
      # render :show
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :description)
  end
end
