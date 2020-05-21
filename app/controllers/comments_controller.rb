class CommentsController < ApplicationController
  include SessionsHelper
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  #before_action :correct_user, only: [ :edit, :destroy]

  # GET /comments/by/:id
  def index
    @comments = Comment.where("user_id = ?", params[:id])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user ||= current_user

    if @comment.save
      @comment.user.touch
      flash[:success] = "Comment recorded."
      redirect_back fallback_location: "/"  
    else
      flash[:warning] = "Comment failed, please try again."
      flash[:danger] = @comment.errors.full_messages.join("\n\n")
      redirect_back fallback_location: "/"
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /comments/to/:id
  def to_user
    user = User.find(params[:id])
    posts = user.posts
    post_ids = posts.map {|post| post.id}
    @comments = Comment.where("post_id in (?)", post_ids)
    render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
