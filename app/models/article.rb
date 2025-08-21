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
    other_likes_count = likes.count - 1

    if other_likes_count < 100 then
      rounded_likes_count = other_likes_count
    elsif other_likes_count >= 100 && other_likes_count < 999 then
      rounded_likes_count = other_likes_count.floor(-1)
    elsif other_likes_count >= 1000 && other_likes_count < 9999 then
      rounded_likes_count = other_likes_count.floor(-2)
    elsif other_likes_count >= 10000 then
      rounded_likes_count = other_likes_count.floor(-3)
    end

    if likes.count == 1 then
      "#{random_like.user.account} liked this post!"
    elsif likes.count > 1 then
      "#{random_like.user.account} and #{rounded_likes_count} other liked this post!"
    end
  end
end
