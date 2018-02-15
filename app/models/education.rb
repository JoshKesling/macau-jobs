# == Schema Information
#
# Table name: educations
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  cv_id           :integer
#  name            :string
#  city            :string
#  country         :string
#  years_attended  :integer
#  year_completed  :integer
#  months_attended :integer
#  graduated       :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Education < ApplicationRecord
  belongs_to :cv

  validates :name, length: { maximum: 50 }, allow_blank: true
  validates :city, length: { maximum: 50 }, allow_blank: true
  validates :country, length: { maximum: 50 }, allow_blank: true
  validates :years_attended, numericality: { only_integer: true }, allow_blank: true
  validates :year_completed, numericality: { only_integer: true }, allow_blank: true
  validates :months_attended, numericality: { only_integer: true }, allow_blank: true
  validates :graduated, inclusion: { in: [true, false] }, allow_blank: true
end
