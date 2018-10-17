class FoodPresenter < BasePresenter
  def initialize(food)
    @food = food
  end

  def basic
    food = {}
    food[:id] = @food.id
    food[:name] = @food.name
    food[:created_at] = @food.created_at
    food[:updated_at] = @food.updated_at
    food
  end
end
