class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

with_options presence: true do
  validates :image, :name, :explanation
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :shipping_prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1}
  validates :price, format: {with: /\A\d[0-9]+\z/, message: "is invalid. Input half-width characters."}
end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

end
