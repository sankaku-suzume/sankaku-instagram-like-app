# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  account                :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
