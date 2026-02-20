FactoryBot.define do
  factory :sock do
    association :owner, factory: :user

    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    age { rand(0..10) }
    color { Faker::Color.name }
    gender { %w[male female].sample }
    height { %w[ankle calf knee].sample }
  end
end
