class DonationAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code,  :prefecture, :city, :address, :building_name, :phone_number, :order_id

  with_options presence: true do
    # 郵便番号(数字3桁、ハイフン、数字4桁の並びのみ許可)
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # 都道府県
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    # 市区町村 
    validates :city
    # 番地
    validates :address
    # 電話番号
    validates :phone_number, format: {with: /\A\d{3}[-]\d{4}[-]\d{4}\z/ }
    
    validates :user_id
    validates :item_id
  end

  def save
  # 寄付情報を保存し、変数donationに代入する
  order = Order.create(user_id: :user_id, item_id: item_id)
  # 住所を保存する
  # donation_idには、変数donationのidと指定する
  Payment.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order_id)

end

end