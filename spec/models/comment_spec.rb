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
