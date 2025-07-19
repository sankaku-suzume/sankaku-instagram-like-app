class CommentMailer < ApplicationMailer
  def mention_comment(user, comment)
    @user = user
    @comment = comment
    mail to: user.email, subject: 'You were mentioned in a comment'
  end
end
