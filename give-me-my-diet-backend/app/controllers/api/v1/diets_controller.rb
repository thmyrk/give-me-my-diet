module Api
  module V1
    class DietsController < ApiController
      def show
        validate_params!(DietsShowSchema::Schema)
        diet = UseCases::Diets::Show.new(diets_show_params).call
        render_ok(DietPresenter.new(diet).build(:basic, :with_full_meals))
      end

      private

      def diets_show_params
        params.permit(:id)
      end
    end
  end
end
