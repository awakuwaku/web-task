class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 本の管理テーブルと1:nで関連付け
  has_many :books, dependent: :destroy

  attachment :profile_image

  # ユーザ名と自己紹介文のバリデーションの追加
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validates :name, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
