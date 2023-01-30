class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  # has_one :order
  
  with_options presence: true do
    validates : image
    validates : item_name
    validates : explanation
    validates : category_id
    validates : condition_id
    validates : postage_id
    validates : prefecture_id
    validates : preparation_id
    validates : price
  end
  
end
