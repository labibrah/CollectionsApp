class Collection < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  

    enum topic: { books: 0, signs: 1, silverware: 2, others: 3 }
 
  
  # Validation for topic
  validates :topic, presence: true, inclusion: { in: Collection.topics.keys }


  before_save :initialize_custom_fields
  # Serialize custom fields to JSON when saving to the database
  def custom_fields=(value)
    self[:custom_fields] = value.to_json
  end

  # Deserialize custom fields from JSON when reading from the database
  def initialize_custom_fields
    self.custom_fields ||= {}
  end
end
