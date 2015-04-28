class PostsController < ApplicationController

  before_action :set_story, except: [:destroy]
  before_action :set_post, only: [:edit, :update, :destroy]
  
  def create
    @story.posts.create(post_params)

    if @story.save
      flash[:notice] = "Post successful!"
      redirect_to story_path(@story)
    else
      flash.now[:danger] = "Error creating post"
      redirect_to story_path(@story)
    end

  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to story_path(@post.story)
    else
      flash.now[:danger] = "There was some kind of error"
      render :edit
    end
  end

  def destroy

    if @post.destroy
      flash[:notice] = "Post successfully destroyed"
      redirect_to story_path(@post.story)
    else
      flash.now[:danger] = "There was an error"
    end
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
