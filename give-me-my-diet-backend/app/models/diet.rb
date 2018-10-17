class Diet < ApplicationRecord
  has_many :meals

  validates :name, presence: true
end
