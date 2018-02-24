# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  open        :boolean
#  closed_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  summary     :text
#  agent_id    :integer
#  user_id     :integer
#

class Job < ApplicationRecord
  belongs_to :agent
  has_and_belongs_to_many :users

  validates :title, length: { in: 1..50 }, presence: true
  validates :summary, length: { in: 1..250 }, presence: true
  validates :body, length: { in: 1..7500 }, presence: true
  validates :agent_id, presence: true
end
