# == Schema Information
#
# Table name: meals
#
#  id   :bigint(8)        not null, primary key
#  name :string           not null
#

require "rails_helper"

RSpec.describe Meal, type: :model do
  it { is_expected.to validate_presence_of(:name) }
end
