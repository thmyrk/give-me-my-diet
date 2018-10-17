# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# diets
diets = []
diets << Diet.create!(name: "Bulk")

# foods
foods = []
foods << Food.create!(name: "Raw brocolli")
foods << Food.create!(name: "Chicken breast")
foods << Food.create!(name: "Oatmeal")

# meals
meals = []
meals << Meal.create!(name: "Breakfast", diet: diets[0])
meals << Meal.create!(name: "Lunch", diet: diets[0])

# meals foods
FoodMeal.create!(meal: meals[0], food: foods[0])
FoodMeal.create!(meal: meals[0], food: foods[1])
FoodMeal.create!(meal: meals[1], food: foods[1])
FoodMeal.create!(meal: meals[1], food: foods[2])
