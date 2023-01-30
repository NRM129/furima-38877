class Item < ApplicationRecord
  belongs_to :user
  # has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :postage
    belongs_to :prefecture
    belongs_to :preparation

  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :price
    validates :category_id,numericality:     { other_than: 1 , message: "can't be blank"}
    validates :condition_id,numericality:    { other_than: 1 , message: "can't be blank"}
    validates :postage_id,numericality:      { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id,numericality:   { other_than: 1 , message: "can't be blank"}
    validates :preparation_id,numericality:  { other_than: 1 , message: "can't be blank"}
    
  end
  
end