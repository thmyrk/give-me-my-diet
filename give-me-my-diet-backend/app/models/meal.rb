# == Schema Information
#
# Table name: meals
#
#  id   :bigint(8)        not null, primary key
#  name :string           not null
#

class Meal < ApplicationRecord
  belongs_to :diet
  has_many :food_meals
  has_many :foods, through: :food_meals

  validates :name, presence: true
end
