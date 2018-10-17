class DietPresenter < BasePresenter
  def initialize(diet)
    @diet = diet
  end

  def basic
    diet = {}
    diet[:id] = @diet.id
    diet[:name] = @diet.name
    diet[:created_at] = @diet.created_at
    diet[:updated_at] = @diet.updated_at
    diet
  end

  def with_full_meals
    diet = {}
    diet[:meals] = MealsPresenter.new(@diet.meals).build_many(:basic, :with_foods)
    diet
  end
end
