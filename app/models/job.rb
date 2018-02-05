class Job < ApplicationRecord
  belongs_to :agent
  belongs_to :user

  validates :title, length: { in: 1..50 }, presence: true
  validates :summary, length: { in: 1..250 }, presence: true
  validates :body, length: { in: 1..7500 }, presence: true
  validates :agent, presence: true
end
