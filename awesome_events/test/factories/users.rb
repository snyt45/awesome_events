FactoryBot.define do
  factory :user, aliases: [:owener] do
    provider { "github" }
    sequence(:uid) { |i| "uid#{i}" }
    sequence(:name) { |i| "name#{i}" }
    sequence(:image_url) { |i| "http://example.com/image#{i}.jpg" }
  end
end
