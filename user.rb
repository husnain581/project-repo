class User < ApplicationRecord
  has_secure_password
  #Relations
  has_many :tweets,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :addresses, as: :addressable
  has_many :contacts, as: :contactable
  #Validations
  validates :name, presence: true,length: {in: 3..20}, format: {with: /[a-zA-Z]/}
  validates :user_name, presence: true,length: {in: 3..20}
  validates :email, presence: true,uniqueness: true
  #Nested Attributes
  accepts_nested_attributes_for :addresses,allow_destroy: true
  accepts_nested_attributes_for :contacts,allow_destroy: true
end
