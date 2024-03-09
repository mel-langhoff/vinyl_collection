FactoryBot.define do
  factory :vinyl do
    name { Faker::Music.band }
    album_title { Faker::Music.album }
    notes { Faker::Lorem.sentence }
  end
end