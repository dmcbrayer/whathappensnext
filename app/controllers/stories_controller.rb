class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  
  def index
    @stories = Story.all
  end

  def show
    @posts = @story.posts.all
    @post = @story.posts.new
  end

  def new
    @story = current_user.stories.new
  end

  def edit
  end

  def create
    @story = current_user.stories.create(story_params)

    if @story.save
      flash[:notice] = "Story was successfully created"
      redirect_to story_path(@story)
    else
      flash.now[:error] = "There was an error creating the story"
      render :new
    end
  end

  def update
    if @story.update(story_params)
      flash[:notice] = "Story was successfully updated"
      redirect_to story_path(@story)
    else
      flash.now[:error] = "There was an error creating the story"
      render :edit
    end
  end

  def destroy

    if @story.destroy
      flash[:notice] = "Story was successfully destroyed.  Utterly."
      redirect_to root_url
    else
      flash.now[:error] = "Story could not be destroyed"
      redirect_to story_path(@story)
    end
  end

  private

    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:title, :description)
    end
end

