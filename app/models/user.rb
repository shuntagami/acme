class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { maximum: 20 }

  validates :access_token, presence: true
  validates :access_token, uniqueness: true
end
