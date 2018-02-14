# == Schema Information
#
# Table name: previous_employments
#
#  id            :integer          not null, primary key
#  employer_name :string
#  job_duties    :text
#  months        :integer
#  years         :integer
#  ended_year    :integer
#  location      :string
#  user_id       :integer
#  cv_id         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PreviousEmployment < ApplicationRecord
  belongs_to :cv

  validates :employer_name, length: { maximum: 100 }, allow_blank: true
  validates :job_duties, length: { maximum: 255 },allow_blank: true
  validates :months, numericality: { only_integer: true }, inclusion: { in: 0..12 },allow_blank: true
  validates :years, numericality: { only_integer: true }, inclusion: { in: 0..100 }, allow_blank: true
  validates :ended_year, timeliness: { on_or_before: lambda { Date.current } }, allow_blank: true
  validates :location, length: { maximum: 255 },allow_blank: true
end
