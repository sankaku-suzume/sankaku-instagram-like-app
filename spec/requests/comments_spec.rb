require 'rails_helper'
require "active_decorator/rspec"

RSpec.describe "Comments", type: :request do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }
  let!(:article) { create(:article, user: user) }
  let!(:comment) { create_list(:comment, 3,  user: user, article: article) }
  

  describe "GET /comments" do
    it '200ステータスが返ってくる' do
      get article_comments_path(article)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /comments' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it 'コメントが保存される' do
        comment_params = attributes_for(:comment, user: user)
        post article_comments_path(article), params: { comment: comment_params }
        expect(response).to have_http_status(200)
        body = JSON.parse(response.body)
        expect(body['comment']['content']).to eq comment_params[:content]
        expect(body['comment']['user']['account']).to eq comment_params[:user].account
      end
    end
  end
end
