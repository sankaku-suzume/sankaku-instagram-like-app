class LikesController < ApplicationController
  before_action :authenticate_user!

  def show
    article = Article.find(params[:article_id])
    like_status = current_user.has_liked?(article)
    render json: { hasLiked: like_status}
  end
end