class PostsController < ApplicationController
  def index
    @writer = Writer.find params[:writer_id]
    @posts = @writer.posts
  end
  
  def new
    @writer = Writer.find params[:writer_id]
    @post = Post.new
    # @post = @writer.posts.new
  end
  
  def show
    @post = Post.find params[:id]
  end

  def edit
     @post = Post.find params[:id]
     @writer = @post.writer 
  end

  def create
    @writer = Writer.find params[:writer_id]
    @post = Post.new post_params
    @post.writer = @writer
    if @post.save
      flash[:notice] = 'New posting has created!'
      redirect_to writer_posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to writer_posts_path(post.writer)
  end

  private 
  def post_params
     params.require(:post).permit(:title, :body, :category, :writer_id)
  end

end
