module UseCases
  module Diets
    class Show
      def initialize(params)
        @params = params
      end

      def call
        Diet.find(@params[:id])
      end
    end
  end
end
