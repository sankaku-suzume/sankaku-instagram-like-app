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
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }

  context 'contentに値が入っている場合' do
    let!(:comment) { build(:comment, user: user, article: article) }

    it 'コメントを保存できる' do
      expect(user).to be_valid
    end
  end

  context 'contentの値が空の場合' do
    let!(:comment) { build(:comment, content: '', user: user, article: article) }

    before do
      comment.save
    end

    it 'コメントを保存できない' do
      expect(comment.errors.messages[:content][0]).to eq("can't be blank")
    end
  end
end
