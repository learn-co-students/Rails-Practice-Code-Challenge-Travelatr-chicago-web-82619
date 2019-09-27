class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :like]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def like
    @post = Post.find_by(id: params[:id])
    # raise @post.inspect
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end
  private

  def find_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit([:title,:content,:likes, :blogger_id, :destination_id])
  end
end
