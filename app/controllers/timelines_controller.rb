class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    followings_articles = Article.where(user_id: user_ids)
    popular_articles = Article.joins(:likes).group(:id).order('COUNT(likes.id) DESC').limit(5).where("articles.created_at > ?", 24.hours.ago)
    @articles = Article.where(id: popular_articles.select(:id)).or(Article.where(id: followings_articles.select(:id))).order(created_at: :DESC)
  end
end