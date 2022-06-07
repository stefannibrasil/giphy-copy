FactoryBot.define do
  factory :user do
    trait :with_gifs do
      gifs { [association(:gif)] }
    end
  end
end
