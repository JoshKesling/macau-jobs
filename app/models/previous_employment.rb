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
  belongs_to :user
  belongs_to :cv
end
