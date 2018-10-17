require "database_cleaner"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(
      :truncation, except: %w[permissions permission_categories permission_category_permissions]
    )
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
