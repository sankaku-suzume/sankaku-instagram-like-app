# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :content, presence: true
  validates :content, format: { with: /\S/ }

  after_create :send_email

  private
  def send_email
    users = User.all
    users.each do |user|
      mention = '@' + user.account
      if self.content.include?(mention)
        CommentMailer.mention_comment(user, self).deliver_later
      end
    end
  end
end
