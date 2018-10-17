FactoryBot.define do
  factory :diet do
    sequence(:name) { |i| "Diet name #{i}" }
  end
end
