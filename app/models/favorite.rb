class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  # 1つツイートに1つのユーザーしかいいねができないよう制限
  validates :book_id, uniqueness: { scope: :user_id }
end
