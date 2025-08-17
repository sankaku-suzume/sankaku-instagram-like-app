# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
FactoryBot.define do
  factory :article do
    content { Faker::Lorem.characters(number: 10) }

    after(:build) do |article|
      article.images.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/default-avatar.png')),
        filename: 'default-avatar.png',
        content_type: 'image/png'
      )
    end
  end
end
