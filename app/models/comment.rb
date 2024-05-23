class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # Ensure the body is present
  validates :body, presence: true
end
