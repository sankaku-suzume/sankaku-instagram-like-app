require 'rails_helper'

RSpec.describe 'Article', type: :system do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }
  let!(:comment) { create(:comment, user: user, article: articles.first) }

  it '記事一覧が表示される' do
    visit articles_path
    articles.each do |article|
      expect(page).to have_css('.article_articleCommentContent', text: article.content)
    end
  end

  it 'コメント一覧が表示される' do
    visit articles_path

    article = articles.first
    find("#comment-icon_#{article.id}").click

    expect(page).to have_css('.comment_commentContent', text: comment.content)
  end
end