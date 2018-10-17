class MealsPresenter < BasePresenter
  def initialize(meals)
    @meals = meals
  end

  def build_many(*representations, **keyword_representations)
    @meals.map do |meal|
      MealPresenter.new(meal).build(*representations, keyword_representations)
    end
  end
end
