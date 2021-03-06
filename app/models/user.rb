class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :attendances, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :salary, presence: true
  validates :role, presence: true

  enum role: {
    general: 0,
    admin: 1
  }
end
