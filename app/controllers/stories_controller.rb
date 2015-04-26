class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  
  def index
    @stories = Story.all
  end

  def show
  end

  def new
    @story = current_user.stories.new
  end

  def edit
  end

  def create
    @story = current_user.stories.create(story_params)

    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def update
    if @story.update(story_params)
      redirect_to story_path(@story)
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to root_url
  end

  private

    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:title, :description)
    end
end

