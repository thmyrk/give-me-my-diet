class CreateDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :diets, id: :uuid do |t|
      t.string :name, null: false
      t.boolean :current, default: false

      t.timestamps
    end
  end
end
