require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:article) do
    article = user.articles.build({
      content: Faker::Lorem.characters(number: 10)
    })
    article.images.attach(io: File.open('spec/fixtures/files/default-avatar.png'), filename: 'default-avatar.png', content_type: 'image/png')
    article.save
    article
  end

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
