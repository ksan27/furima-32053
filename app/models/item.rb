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
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :status_id
        validates :shipping_fee_id
        validates :shipping_prefecture_id
        validates :shipping_day_id
      end
    validates :price, format: { with: /\A\d[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end

end
