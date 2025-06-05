class ArticlesController < ApplicationController
  def index
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

  private
  def article_params
    params.require(:article).permit(:content, images: [])
  end
end
