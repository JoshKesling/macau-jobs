class Cv < ApplicationRecord
  belongs_to :user

  has_many :educations, dependent: :destroy
  has_many :languages, dependent: :destroy

  has_attached_file :head_pic, styles: { thumb: '100x100', small: '300x300', large: '600x600' }
  validates_attachment_content_type :head_pic, content_type: %w[image/jpg image/jpeg image/png image/gif], size: { in: 0..1500.kilobytes }, if: proc { |a| a.head_pic.present? }
  has_attached_file :body_pic, styles: { thumb: '100x100', small: '300x300', large: '600x600' }
  validates_attachment_content_type :body_pic, content_type: %w[image/jpg image/jpeg image/png image/gif], size: { in: 0..1500.kilobytes }, if: proc { |a| a.body_pic.present? }

  validates :first_name, length: { in: 1..30 }, allow_blank: true
  validates :middle_name, length: { in: 1..30 }, allow_blank: true
  validates :last_name, length: { in: 1..30 }, allow_blank: true
  validates :age, numericality: { only_integer: true }, allow_blank: true
  validates :height, numericality: { only_integer: true }, allow_blank: true
  validates :weight, numericality: { only_integer: true }, allow_blank: true
  validates :marital_status, inclusion: { in: %w[Single Married Separated Divorced] }
  validates :children, numericality: { only_integer: true }, allow_blank: true
  validates :phone_number, length: { in: 7..25 }, allow_blank: true
  validates :current_address_L1, length: { maximum: 100 }, allow_blank: true
  validates :current_address_L2, length: { maximum: 100 }, allow_blank: true
  validates :current_city, length: { maximum: 50 }, allow_blank: true
  validates :current_country, length: { maximum: 50 }, allow_blank: true
  validates :skills, length: { maximum: 250 }, allow_blank: true
  validates :work_visa, inclusion: { in: [true, false] }
  validates :visa_exp_date, timeliness: { on_or_after: -> { Date.current } }, allow_blank: true
  validates :passport_country, length: { maximum: 50 }, allow_blank: true
  validates :passport_number, length: { in: 5..25 }, allow_blank: true
  validates :passport_expiration_date, timeliness: { on_or_after: -> { Date.current } }, allow_blank: true

  accepts_nested_attributes_for :educations
  accepts_nested_attributes_for :languages

  # Set the list of preferred countries.
  PREFERRED_COUNTRIES = %w[Indonesia
                    Philippines
                    Malaysia
                    Thailand
                    India
                    Nepal
                    Singapore
                    Bangladesh
                    Cambodia
                    China
                    French\ Polynesia
                    Hong\ Kong
                    Macao
                    Micronesia
                    Sri\ Lanka
                    Taiwan
                    Viet\ Nam]

end
