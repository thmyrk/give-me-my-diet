module Api
  module V1
    class ApiController < ActionController::API
      rescue_from ActiveRecord::RecordInvalid, with: :bad_request
      rescue_from ActionController::BadRequest, with: :bad_request
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def validate_params!(validator)
        schema = validator.call(params.permit!.to_h)
        raise ActionController::BadRequest, schema.messages if schema.failure?
      end

      def render_ok(response = {})
        render status: :ok, json: response
      end

      def render_created(response = {})
        render status: :created, json: response
      end

      def bad_request(response = {})
        render status: :bad_request, json: { errors: response }
      end

      def not_found(response = {})
        render status: :not_found, json: { errors: response }
      end
    end
  end
end
