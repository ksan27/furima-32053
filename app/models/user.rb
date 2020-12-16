class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'は英字と数字の両方を含めてください' }
    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください' }
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください' }
    validates :first_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角で入力してください' }
    validates :last_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角で入力してください' }
    validates :birthday, presence: true
  end
end
