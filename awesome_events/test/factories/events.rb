FactoryBot.define do
  factory :event do
    owner # event作成時に関連のownerも作成され、作成された関連のowner_idが使われる
    sequence(:name) { |i| "イベント名#{i}" }
    sequence(:place) { |i| "イベント開催場所#{i}" }
    sequence(:content) { |i| "イベント本文#{i}" }
    start_at { rand(1..30).days.from_now }
    end_at { start_at + rand(1..30).hours }
  end
end
