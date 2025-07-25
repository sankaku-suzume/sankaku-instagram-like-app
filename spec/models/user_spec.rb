require 'rails_helper'

RSpec.describe User, type: :model do
  context 'accountに値が入っている場合' do
    let!(:user) { build(:user) }

    it 'サインインできる' do
      expect(user).to be_valid
    end
  end

  context 'accountの値が空の場合' do
    let!(:user) { build(:user, account: '') }

    before do
      user.save
    end

    it 'サインインできない' do
      expect(user.errors.messages[:account][0]).to eq("can't be blank")
    end
  end

  context 'accountの値がユニークでない場合' do
    let!(:existing_user) { create(:user, account: 'test') }
    let!(:user) { build(:user, account: 'test') }

    before do
      user.save
    end

    it 'サインインできない' do
      expect(user.errors.messages[:account][0]).to eq("has already been taken")
    end
  end
end
