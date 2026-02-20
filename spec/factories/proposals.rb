FactoryBot.define do
  factory :proposal do
    association :sock
    association :proposed_sock, factory: :sock
  end
end
