class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # VALID_PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}\z/i

  has_one :address
  accepts_nested_attributes_for :address

  has_many :joins, dependent: :destroy
  has_many :joined_events, through: :joins, source: :event

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX
  # validates :password_digest, format: VALID_PASSWORD_REGEX

end
