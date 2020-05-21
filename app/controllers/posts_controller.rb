class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  include SessionsHelper
  before_action :logged_in?, only: :create
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(page: params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @post.views += 1
    @post.save
  end

  # GET /posts/new
  def new
    @post = Post.new
    unless logged_in?
      flash[:warning] = "You have to log in to post."
      redirect_to "/login"
    end 
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.category = Category.find(params[:post][:category_id])
    @post.views = 0

    if @post.save
      @post.user.touch
      redirect_to @post
    else
      format.html { render :new }
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user
    @posts = Post.where("user_id = ?", params[:id])
    render "posts/user"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :category, :user_id, :comment, :category_id)
    end
end
