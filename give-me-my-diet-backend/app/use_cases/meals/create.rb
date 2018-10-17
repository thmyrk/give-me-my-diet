module UseCases
  module Meals
    class Create
      def initialize(params)
        @params = params
      end

      def call
        Meal.create!(name: @params[:name], diet_id: @params[:diet_id])
      end
    end
  end
end
