class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one :purchase
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
    validates :price, format: { with: /\A\d[0-9]+\z/, message: 'は半角数字で入力してください' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は範囲外です' }
  end

  def previous
    user.items.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end
  def next
    user.items.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
end
