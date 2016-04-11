class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    authorize @topic
    if @topic.save
      flash[:notice] = "Topic has been created."
      redirect_to topics_path
    else
      flash[:error] = "Error saving your topic."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])

    authorize @topic
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic has been updated"
      redirect_to topics_path
    else
      flash[:error] = "Error updating your topic"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    
    authorize @topic
    if @topic.destroy
      flash[:notice] = "Topic has been deleted"
      # redirect_to topics_path
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
  def topic_params
    params.require(:topic).permit(:title)
  end
end
