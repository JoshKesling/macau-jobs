class Agent < ApplicationRecord
  has_many :jobs

  validates :name, presence: :true, uniqueness: { case_sensitive: false }
  validates :email, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :email, with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/, multiline: true
  
end
