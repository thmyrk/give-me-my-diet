class BaseSchema < Dry::Validation::Schema
  configure do
    predicates(CustomSchemaPredicates)
    config.messages = :i18n
  end
end
