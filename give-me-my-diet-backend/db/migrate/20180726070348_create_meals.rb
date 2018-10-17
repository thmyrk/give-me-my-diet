class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals, id: :uuid do |t|
      t.string :name, null: false
      t.uuid :diet_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
