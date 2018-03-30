class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
        flash[:notice] = "Post was successfully updated"
        redirect_to post_path
      else
        render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
     if @post.delete
       flash[:notice] = "Post was successfully deleted"
       redirect_to posts_path
     end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
