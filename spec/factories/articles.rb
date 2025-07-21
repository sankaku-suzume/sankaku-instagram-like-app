# FactoryBot.define do
#   factory :article do
#     content { Faker::Lorem.characters(number: 10) }
#     images.attach(io: File.open('spec/fixtures/files/default-avatar.png'), filename: 'default-avatar.png', content_type: 'image/png')
#   end
# end