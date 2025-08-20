# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  has_many_attached :images

  validates :images, presence: true
  validates :content, presence: true
  validates :content, format: { with: /\S/ }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def random_liked_user(article)
    likes = article.likes.all
    random_like = likes.offset(rand(likes.count)).first
    if likes.count == 1 then
      "#{random_like.user.account} liked this post!"
    elsif likes.count > 1 then
      "#{random_like.user.account} and #{likes.count - 1} other liked this post!"
    end
  end
end
