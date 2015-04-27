class PostsController < ApplicationController

  before_action :set_story
  before_action :set_post, only: [:edit, :update, :destroy]
  
  def create
    @story.posts.create(post_params)

    if @story.save
      redirect_to story_path(@story)
      flash.now[:success] = "Post successful!"
    else
      redirect_to story_path(@story)
      flash.now[:danger] = "Error creating post"
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_story
      @story = Story.find(params[:story_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :favorite)
    end
end
