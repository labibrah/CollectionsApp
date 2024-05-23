class Item < ApplicationRecord
  belongs_to :collection
  has_many :comments
  has_many :likes

  # serialize :tags, Array # Store tags as an array
end
