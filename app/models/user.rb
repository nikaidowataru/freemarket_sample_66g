class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day, :phone_number, presence: true
  

  validates :email, uniqueness: true

  validates :password, length: { minimum: 7}

  validates :phone_number, uniqueness: true,
                           format: {with: /\A[0-9-]{,14}\z/}





  has_many :items
  has_many :likes
  has_many :values
  has_one :address
  accepts_nested_attributes_for :address
  has_one :card
  accepts_nested_attributes_for :card
end
