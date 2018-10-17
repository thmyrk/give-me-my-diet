class CreateMealsDietsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :meals_diets, id: :uuid do |t|
      t.uuid :meal_id, null: false, index: true, foreign_key: true
      t.uuid :diet_id, null: false, index: true, foreign_key: true
      t.integer :order, null: false
    end
  end
end
