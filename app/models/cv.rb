# == Schema Information
#
# Table name: cvs
#
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  first_name               :string
#  middle_name              :string
#  last_name                :string
#  age                      :integer
#  height                   :integer
#  weight                   :integer
#  marital_status           :string
#  children                 :integer
#  phone_number             :string
#  current_address_L1       :string
#  current_address_L2       :string
#  current_city             :string
#  current_country          :string
#  skills                   :text
#  work_visa                :boolean
#  visa_exp_date            :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  passport_country         :string
#  passport_number          :string
#  passport_expiration_date :date
#  head_pic_file_name       :string
#  head_pic_content_type    :string
#  head_pic_file_size       :integer
#  head_pic_updated_at      :datetime
#  body_pic_file_name       :string
#  body_pic_content_type    :string
#  body_pic_file_size       :integer
#  body_pic_updated_at      :datetime
#

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
