class StaticPagesController < ApplicationController
  include SessionsHelper

  def home
    if params[:category].nil?
      @posts = Post.where('created_at >= ?', 30.days.ago).order(created_at: :desc).paginate(page: params[:page], per_page: 10) 
    else 
      @posts = Post.where('category_id in (?)', params[:category]).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def setting
    if logged_in?
      @user = current_user
      @verification = @user.verification || Verification.new
    else
      flash[:warning] = "Please log in."
      redirect_to "/login"
    end
  end

end
