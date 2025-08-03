require 'rails_helper'

RSpec.describe "Apps::Profiles", type: :request do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }
  describe "GET /apps/profiles" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it "200 Status" do
        get profile_path
        expect(response).to have_http_status(200)
      end

      it "200 Status" do
        get edit_profile_path
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get profile_path
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'ログイン画面に遷移する' do
        get edit_profile_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
end
