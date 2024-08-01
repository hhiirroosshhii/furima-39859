class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # 文字の指定 
  ALPHANUMERIC_REGEX = /\A[a-zA-Z0-9]+\z/
  FULL_WIDTH_REGEX = /\A[^\x00-\x7F]+\z/
  KATAKANA_REGEX = /\A[\p{Katakana}]+\z/

  # バリデーション
  validates :nickname,presence: true
  validates :password,presence: true, format:{with: ALPHANUMERIC_REGEX}, length:{minimum: 6}
  validates :last_name, presence: true, format:{with: FULL_WIDTH_REGEX}
  validates :first_name, presence: true, format:{with: FULL_WIDTH_REGEX}
  validates :last_name_kana, presence: true, format:{with: KATAKANA_REGEX}
  validates :first_name_kana, presence: true, format:{with: KATAKANA_REGEX}
  validates :birthday, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
            
   
end
