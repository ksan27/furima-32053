class ItemPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, 
                :prefecture_id, 
                :city, 
                :house_number, 
                :building_name, 
                :phone_number, 
                :user_id, 
                :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "City Full-width characters"}
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: "is invalid. Input half-width characters." }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Adress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end