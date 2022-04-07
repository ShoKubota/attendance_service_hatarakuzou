class User < ApplicationRecord
  has_many :attendances, dependent: :destroy

  enum role: { 
    general: 0, 
    admin: 1
  }
end
