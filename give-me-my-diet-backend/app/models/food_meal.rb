class FoodMeal < ApplicationRecord
  self.table_name = "foods_meals"

  belongs_to :meal
  belongs_to :food
end
