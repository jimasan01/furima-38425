class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # アソシエーション
  has_many :items
  has_many :orders

  # パスワードは、半角英数字混合での入力が必須
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Please include both letters and numbers' 

  with_options presence: true do
    
    validates :nickname
    # 全角（漢字・ひらがな・カタカナ）での入力が必須
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    # 全角（カタカナ）での入力が必須
    validates :family_name_kana, format: { with: /\A[ァ-ヶ一]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ一]+\z/ }
    validates :birthday
  end
end