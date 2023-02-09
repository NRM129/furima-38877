class OrderPayment
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    # 郵便番号(数字3桁、ハイフン、数字4桁の並びのみ許可)
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    # 都道府県
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    # 市区町村
    validates :city
    # 番地
    validates :address
    # 電話番号
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }

    validates :user_id
    validates :item_id

    validates :token
  end

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Payment.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
