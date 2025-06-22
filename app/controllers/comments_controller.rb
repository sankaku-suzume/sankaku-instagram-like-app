class CommentsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def create
    article = Article.find(params[:article_id])
    comment = article.comments.build(comment_params.merge(user_id: current_user.id))
    comment.save!

    render json: {
      comment: {
        content: comment.content,
        user: {
          account: comment.user.account,
          avatar_image: url_for(comment.user.avatar_image)
        }
      }
    }
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end