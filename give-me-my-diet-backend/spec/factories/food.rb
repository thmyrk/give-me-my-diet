FactoryBot.define do
  factory :food do
    sequence(:name) { |i| "Food name #{i}" }
  end
end
