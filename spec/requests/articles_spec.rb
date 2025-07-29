require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }

  describe "GET /articles" do
    it '200ステータスが返ってくる' do
      get articles_path
      expect(response).to have_http_status(200)
    end

    it '200ステータスが返ってくる' do
      get article_path(id: articles.first.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /articles' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '記事が保存される' do
        article_params = attributes_for(:article)
        article_params['images'] = [
          fixture_file_upload(Rails.root.join('spec/fixtures/files/default-avatar.png'), 'image/png')
        ]
        post articles_path, params: { article: article_params }
        expect(response).to have_http_status(302)
        expect(Article.last.content).to eq(article_params[:content])
      end
    end

    context 'ログインしていない場合' do
       it 'ログイン画面に遷移する' do
        article_params = attributes_for(:article)
        article_params['images'] = [
          fixture_file_upload(Rails.root.join('spec/fixtures/files/default-avatar.png'), 'image/png')
        ]
        post articles_path, params: { article: article_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT /articles' do
    before do
      sign_in user
    end

    context 'パラメーターが正常な場合' do
      let!(:article_params) { attributes_for(:article) }

      it '自分の記事を変更できる' do
        put article_path(articles.first.id), params: { article: article_params }
        expect(response).to have_http_status(302)
        expect(articles.first.reload.content).to eq(article_params[:content])
      end
    end

    context 'パラメーターが異常な場合' do
      let!(:article_params) { attributes_for(:article, content: "") }
       it '記事編集画面がレンダリングされる' do
        post articles_path, params: { article: article_params }
        expect(response).to have_http_status(422)
        expect(response.body).to include('articlePost_form')
      end
    end
  end

  describe 'DELETE /articles' do
    before do
      sign_in user
    end

    it '自分の記事を削除できる' do
      delete article_path(articles.first.id)
      expect(response).to have_http_status(303)
      expect(response).to redirect_to(root_path)
      expect(Article.count).to eq 2
    end
  end
end
