class Language < ApplicationRecord
  belongs_to :user
  belongs_to :cv
end
