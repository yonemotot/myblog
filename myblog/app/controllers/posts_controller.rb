class PostsController < ApplicationController
def index
  @posts =Post.all.order(created_at: 'desc')

end

def show
  @post = Post.find(params[:id])
end

def new 
  @post =Posr.new

end

def create
  #render plain: params[:post].inspect
  #save
  @post = Post.new(post_params)
  if @post.save
  #redirect
  redirect_to posts_path
  else
    #render plain:@post.errors.inspect
    render 'new'
  end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  if @post.update(post_params)
    redirect_to posts_path
  else
    render 'edit'
def destroy
  @post = Post.find(paramas[:id])
  @post.destroy
  redirect_to posts_path
private
 def post_params
  params.require(:post).permit(:title, :body)