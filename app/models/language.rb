class Language < ApplicationRecord
  belongs_to :user, through: :cv, inverse_of: :language
  belongs_to :cv

  validates :name, length: { in: 2..20 }, allow_blank: true
  validates :read, inclusion: { in: %w(None, Basic, Good, Fluent) }
  validates :write, inclusion: { in: %w(None, Basic, Good, Fluent) }
  validates :speak, inclusion: { in: %w(None, Basic, Good, Fluent) }
  validates :listen, inclusion: { in: %w(None, Basic, Good, Fluent) }
end
