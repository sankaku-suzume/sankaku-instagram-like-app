require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }

  describe "GET /articles" do
    it '200ステータスが返ってくる' do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /articles' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it '記事が保存される' do
        # ①
        article_params = attributes_for(:article)
        article_params['images'] = [
          fixture_file_upload(Rails.root.join('spec/fixtures/files/default-avatar.png'), 'image/png')
        ]

        # ②
        # article = user.articles.build({ content: Faker::Lorem.characters(number: 10) })
        # article_params = {
        #   content: article.content,
        #   images: []
        # }
        # image = article.images.attach(
        #   io: File.open(Rails.root.join('spec/fixtures/files/default-avatar.png')),
        #   filename: 'default-avatar.png',
        #   content_type: 'image/png'
        # )
        # article_params[:images].push(image)

        puts article_params
        post articles_path({article: article_params})
        expect(response).to have_http_status(302)
        expect(Article.last.content).to eq(article_params[:content])
      end
    end
  end
end
