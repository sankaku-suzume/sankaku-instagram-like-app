class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'Successfully saved.'
    else
      flash.now[:error] = 'Failed to save.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'Successfully updated.'
    else
      flash.now[:error] = 'Failed to update'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, status: :see_other, notice: 'Successfully deleted.'
  end

  private
  def article_params
    params.require(:article).permit(:content, images: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
