class Education < ApplicationRecord
  belongs_to :user, through: :cv, inverse_of: :education
  belongs_to :cv

  validates :name, length: { maximum: 50 }, allow_blank: true
  validates :city, length: { maximum: 50 }, allow_blank: true
  validates :country, length: { maximum: 50 }, allow_blank: true
  validates :years_attended, numericality: { only_integer: true }, allow_blank: true
  validates :year_completed, timeliness: { on_or_before: lambda { Date.current } }, allow_blank: true
  validates :months_attended, numericality: { only_integer: true }, allow_blank: true
  validates :graduated, inclusion: { in: [true, false] }, allow_blank: true
end
