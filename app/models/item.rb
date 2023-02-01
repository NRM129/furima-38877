class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
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
    validates :price, format: numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    
    # カテゴリー
    validates :category_id, numericality:     { other_than: 1, message: "can't be blank" }
    # 商品の状態
    validates :condition_id, numericality:    { other_than: 1, message: "can't be blank" }
    # 配送料の負担
    validates :postage_id, numericality:      { other_than: 1, message: "can't be blank" }
    # 都道府県
    validates :prefecture_id, numericality:   { other_than: 1, message: "can't be blank" }
    # 発送までの日数
    validates :preparation_id, numericality:  { other_than: 1, message: "can't be blank" }
  end
end
