RSpec.shared_context "model response keys" do
  let(:diet_response_keys) do
    %w[id name meals updated_at created_at]
  end

  let(:meal_response_keys) do
    %w[id name foods updated_at created_at]
  end

  let(:food_response_keys) do
    %w[id name updated_at created_at]
  end
end
