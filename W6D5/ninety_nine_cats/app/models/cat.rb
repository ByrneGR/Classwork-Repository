# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#
require 'action_view'
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  CAT_COLORS = [
    "Magenta",
    "Gold",
    "Black",
    "Orange"
]
  validates :birth_date, presence: true
  validates :color, inclusion: { in: CAT_COLORS }, presence: true
  validates :sex, inclusion: { in: ["M", "F"] }, presence: true
  validates :description, presence: true
  validates :name, presence: true

  def age
  age = Date.today.year - birth_date.year
  end



end  
