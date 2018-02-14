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
#  current_address          :string
#  visa_country             :string
#  completed                :boolean
#

class Cv < ApplicationRecord
  belongs_to :user
  
  has_many :educations, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :previous_employments, dependent: :destroy
  accepts_nested_attributes_for :educations, allow_destroy: true
  accepts_nested_attributes_for :languages, allow_destroy: true
  accepts_nested_attributes_for :previous_employments, allow_destroy: true
  
  after_initialize :init
  before_save :is_complete?
  
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
  validates :marital_status, inclusion: { in: %w[Single Married Separated Divorced Widowed] }
  validates :children, numericality: { only_integer: true }, allow_blank: true
  validates :phone_number, length: { in: 7..25 }, allow_blank: true
  validates :current_address, length: { maximum: 255 }, allow_blank: true
  validates :current_city, length: { maximum: 50 }, allow_blank: true
  validates :current_country, length: { maximum: 50 }, allow_blank: true
  validates :skills, length: { maximum: 250 }, allow_blank: true
  validates :work_visa, inclusion: { in: [true, false] }
  validates :visa_exp_date, timeliness: { on_or_after: -> { Date.current } }, allow_blank: true
  validates :passport_country, length: { maximum: 50 }, allow_blank: true
  validates :passport_number, length: { in: 5..25 }, allow_blank: true
  validates :passport_expiration_date, timeliness: { on_or_after: -> { Date.current } }, allow_blank: true


  def init
    self.completed = false if self.completed.nil?
  end

  def is_complete?
    self.completed = true
    self.attributes.each do |atr|
      self.completed = false if atr.blank?
      return if !self.completed
    end
    self.educations.each do |edu|
      edu.attributes.each do |ea|
        self.completed = false if edu.blank?
        return if !self.completed
      end
    end
    self.languages.each do |exp|
      exp.attributes.each do |exa|
        self.completed = false if exa.blank?
        return if !self.completed
      end
    end
    true
  end

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
