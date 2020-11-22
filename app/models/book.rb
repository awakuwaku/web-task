class Book < ApplicationRecord
  # ユーザとn:1で関連付け
  belongs_to :user

  # titleとbodyのバリデーションの追加
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
