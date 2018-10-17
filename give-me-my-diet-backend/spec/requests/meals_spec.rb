require "rails_helper"

RSpec.describe "Meals API" do
  include_context "model response keys"

  let(:parsed_response) do
    JSON.parse(response.body)
  end

  RSpec.shared_examples "meals invalid parameter format" do |parameter_name, incorrect_value|
    let(:request_params) { super().merge({ parameter_name => incorrect_value }) }
    it do
      subject
      expect(response).to have_http_status(400)
    end
    it { expect { subject }.to change { Meal.count }.by(0) }
    it do
      subject
      expect(parsed_response).to include("errors")
    end
  end

  context "POST #create" do
    let(:name) { "Breakfast" }
    let(:diet) { create(:diet) }
    let(:diet_id) { diet.id }
    let(:request_params) do
      {
        name: name,
        diet_id: diet.id
      }
    end
    subject { post "/api/v1/meals", params: request_params }

    describe "param validation" do
      it_behaves_like "meals invalid parameter format", :name, ""
      it_behaves_like "meals invalid parameter format", :name, nil
      it_behaves_like "meals invalid parameter format", :diet_id, nil
      it_behaves_like "meals invalid parameter format", :diet_id, ""
      it_behaves_like "meals invalid parameter format", :diet_id, "27eca435-d8e8-469b-a037-946feb01292"
    end

    describe "response" do
      before { subject }
      it { expect(response).to have_http_status(201) }
      it { expect(parsed_response).to be_empty }
    end

    it do
      subject
      expect(response).to have_http_status(201)
    end
    it { expect { subject }.to change { Meal.count }.by(1) }
  end
end
