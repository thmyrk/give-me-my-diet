module CustomSchemaPredicates
  include Dry::Logic::Predicates

  predicate(:uuid?) do |value|
    !/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/.match(value).nil?
  end

  predicate(:iso8601?) do |value|
    !/(\d{4})-(\d{2})-(\d{2})T(\d{2})\:(\d{2})\:(\d{2})(([+-](\d{2})\:(\d{2}))|Z)/.match(value).nil?
  end

  predicate(:file?) do |value|
    value.class == ActionDispatch::Http::UploadedFile
  end

  predicate(:remove_custom_report?) do |value|
    value == "destroy"
  end

  predicate(:ext?) do |ext, value|
    File.extname(value.path) == ext
  end

  predicate(:hex_color?) do |value|
    !/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/.match(value).nil?
  end

  predicate(:email?) do |value|
    !/@/.match(value).nil?
  end

  predicate(:checksum?) do |value|
    value.size == 64
  end

  predicate(:boolean?) do |value|
    %w[true false].include?(value)
  end

  predicate(:svg?) do |value|
    !%r{.*<\/svg>$}.match(value.strip).nil?
  end
end
