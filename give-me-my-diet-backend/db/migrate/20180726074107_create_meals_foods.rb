class CreateMealsFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods_meals, id: :uuid do |t|
      t.uuid :meal_id, foreign_key: true, null: false
      t.uuid :food_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
