class MealPresenter < BasePresenter
  def initialize(meal)
    @meal = meal
  end

  def basic
    meal = {}
    meal[:id] = @meal.id
    meal[:name] = @meal.name
    meal[:created_at] = @meal.created_at
    meal[:updated_at] = @meal.updated_at
    meal
  end

  def with_foods
    meal = {}
    meal[:foods] = FoodsPresenter.new(@meal.foods).build_many(:basic)
    meal
  end
end
