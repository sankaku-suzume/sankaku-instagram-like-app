require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context '画像が1つ以上選択されている、かつ内容に文字列が入力されている場合' do
    let!(:article) { build(:article, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context "画像が選択されていない場合" do
    let!(:article) do
      user.articles.create({
        images: nil,
        content: Faker::Lorem.characters(number: 10)
      })
      article.images.attach(io: File.open('spec/fixtures/files/default-avatar.png'), filename: 'default-avatar.png', content_type: 'image/png')
      article
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:images][0]).to eq("can't be blank")
    end
  end

  context '画像が1つ以上選択されているが、contentがスペースのみだった場合' do
    let!(:article) { build(:article, content: ' ', user: user) }
    
    before do
      article.save
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:content][0]).to eq("can't be blank")
    end
  end
end
