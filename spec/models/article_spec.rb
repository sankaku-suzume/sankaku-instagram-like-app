require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context '画像が1つ以上選択されている場合' do
    let!(:article) do
      user.articles.build({
        images: fixture_file_upload('default-avatar.png')
      })
    end

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  # context "画像が選択されていない場合" do
  #   let!(:article) do
  #     user.articles.create({
  #       images: nil
  #     })
  #   end

  #   # it '記事を保存できない' do
  #   #   expect(article.errors.messages)
  #   # end
  # end
  
end
