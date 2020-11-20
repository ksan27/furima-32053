class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

  validates :name, :explanation, :price, :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :shipping_prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1}

end
