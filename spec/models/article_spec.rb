require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context '画像が1つ以上選択されている場合' do
    let!(:article) { build(:article, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end
end
