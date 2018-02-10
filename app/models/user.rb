# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean
#  username               :string
#

class User < ApplicationRecord
  has_one :cv, dependent: :destroy

  has_many :educations, through: :cvs, inverse_of: :user
  has_many :languages, through: :cvs, inverse_of: :user
  has_many :jobs

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..50 }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  # validates_format_of :email, with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/, multiline: true
  validate :validate_username

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end
  

end
