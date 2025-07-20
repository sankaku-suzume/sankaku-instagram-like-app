FactoryBot.define do
  factory :article do
    images { fixture_file_upload('/files/default-avatar.png') }
  end
end