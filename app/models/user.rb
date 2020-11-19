class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'Password Include both letters and numbers' }
    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'First name Full-width characters' }
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Last name Full-width characters' }
    validates :first_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'First name kana Full-width katakana characters' }
    validates :last_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Last name kana Full-width katakana characters' }
    validates :birthday, presence: true
  end
end
