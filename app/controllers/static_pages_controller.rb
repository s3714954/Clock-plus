class StaticPagesController < ApplicationController
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
end
