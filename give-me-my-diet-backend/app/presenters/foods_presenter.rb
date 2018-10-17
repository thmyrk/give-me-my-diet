class FoodsPresenter < BasePresenter
  def initialize(foods)
    @foods = foods
  end

  def build_many(*representations, **keyword_representations)
    @foods.map do |food|
      FoodPresenter.new(food).build(*representations, keyword_representations)
    end
  end
end
