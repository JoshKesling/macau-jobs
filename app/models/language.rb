# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  cv_id      :integer
#  name       :string
#  read       :string
#  write      :string
#  speak      :string
#  listen     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Language < ApplicationRecord
  belongs_to :cv

  validates :name, length: { in: 2..20 }, allow_blank: true
  validates :read, inclusion: { in: %w(None Poor Good Perfect) }, allow_blank: true
  validates :write, inclusion: { in: %w(None Poor Good Perfect) }, allow_blank: true
  validates :speak, inclusion: { in: %w(None Poor Good Perfect) }, allow_blank: true
  validates :listen, inclusion: { in: %w(None Poor Good Perfect) }, allow_blank: true

  # Set the selection options for the ability levels
  def language_levels
   %w(None Poor Good Perfect)
  end
end
