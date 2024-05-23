class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # Validate uniqueness of like per user and item
  validates :user_id, uniqueness: { scope: :item_id }
end
