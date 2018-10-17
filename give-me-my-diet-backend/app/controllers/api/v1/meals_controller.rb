module Api
  module V1
    class MealsController < ApiController
      def create
        validate_params!(MealsCreateSchema::Schema)
        UseCases::Meals::Create.new(meals_create_params).call
        render_created
      end

      private

      def meals_create_params
        params.permit(:name, :diet_id)
      end
    end
  end
end
