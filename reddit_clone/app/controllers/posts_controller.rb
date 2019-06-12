class PostsController < ApplicationController
  before_action :require_login

  def new
    @post = Post.new
       @subs = Sub.all
  end

  def edit
    @post = Post.find(params[:id])
    if @post.author_id == current_user.id
      render :edit
    else
      flash[:errors] = ["User not author"]
      redirect_to post_url(@post)
    end
  end

  def show
    @post = Post.find(params[:id])
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id
 
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.author_id == current_user.id
      if @post.update_attributes(post_params) 
        redirect_to sub_url(@post.sub_id)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["User not author"]
      redirect_to post_url(@post) 
    end     
  end

  def destroy
    @post = post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end

  def post_params
    params.require(:posts).permit(:title,:url,:content)
  end
end
