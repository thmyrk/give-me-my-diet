FactoryBot.define do
  factory :meal do
    sequence(:name) { |i| "Meal name #{i}" }
    diet

    trait :with_foods do
      after(:create) do |meal|
        foods = create_list(:food, 3)
        foods.each { |food| create(:food_meal, food: food, meal: meal) }
      end
    end
  end
end
