class DietsShowSchema
  Schema = Dry::Validation.Params(BaseSchema) do
    required(:id).filled(:uuid?).value(min_size?: 1)
  end
end
