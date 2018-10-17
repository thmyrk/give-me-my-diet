# == Schema Information
#
# Table name: foods
#
#  id   :bigint(8)        not null, primary key
#  name :string           not null
#

class Food < ApplicationRecord
  validates :name, presence: true
end
