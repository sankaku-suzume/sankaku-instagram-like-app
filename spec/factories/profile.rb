FactoryBot.define do
  factory :profile do

    after(:build) do |profile|
      profile.avatar.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/default-avatar.png')),
        filename: 'default-avatar.png',
        content_type: 'image/png'
      )
    end
  end
end