class MealsCreateSchema
  Schema = Dry::Validation.Params(BaseSchema) do
    required(:name).filled(:str?).value(min_size?: 2)
    required(:diet_id).filled(:uuid?).value(min_size?: 1)
  end
end
