class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @post=Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end


  def create
    if  @post = Post.new(post_params)
      @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
        @post.visited = 0
        redirect_to post_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end

private
      def post_params
        params.require(:post).permit(:title, :body)
      end
