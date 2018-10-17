require "rails_helper"

RSpec.describe "Diets API" do
  include_context "model response keys"

  let(:parsed_response) do
    JSON.parse(response.body)
  end

  RSpec.shared_examples "diets invalid parameter format" do |parameter_name, incorrect_value|
    let(:request_params) { super().merge({ parameter_name => incorrect_value }) }
    it do
      subject
      expect(response).to have_http_status(400)
    end
    it do
      subject
      expect(parsed_response).to include("errors")
    end
  end

  context "GET #show" do
    let(:diet) { create(:diet) }
    let(:diet_id) { diet.id }
    let(:diet_name) { diet.name }
    subject { get "/api/v1/diets/#{diet_id}" }

    describe "response" do
      before { subject }

      it { expect(response).to have_http_status(200) }
      it { expect(parsed_response.keys).to match_array(diet_response_keys) }
      it { expect(parsed_response["id"]).to eq(diet_id) }
      it { expect(parsed_response["name"]).to eq(diet_name) }
    end

    it do
      subject
      expect(response).to have_http_status(200)
    end

    context "when diet with given id doesn't exist" do
      let(:diet_id) { "9318343c-0374-4d26-b6cd-f63b18e7cde4" }
      before { subject }

      it { expect(response).to have_http_status(404) }
      it { expect(parsed_response.keys).to eq(["errors"]) }
    end

    context "when diet has meals" do
      let!(:meals) { create_list(:meal, 3, :with_foods, diet: diet) }

      before { subject }
      it { expect(response).to have_http_status(200) }
      it { expect(parsed_response.keys).to match_array(diet_response_keys) }
      it { expect(parsed_response["id"]).to eq(diet_id) }
      it { expect(parsed_response["name"]).to eq(diet_name) }
      it { expect(parsed_response["meals"].first.keys).to match_array(meal_response_keys) }
      it { expect(parsed_response["meals"].first["foods"].first.keys).to match_array(food_response_keys) }
    end
  end
end
