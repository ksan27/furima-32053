require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    it "必須項目が全て存在していれば登録できる" do
      expect(@item).to be_valid
    end
    it "priceが300円~9999999円だと登録できる" do
      @item.price = "300"
      expect(@item).to be_valid
    end
    it "priceが半角数字だと保存できる" do
      @item.price = "300"
      expect(@item).to be_valid
    end

    it "imageが空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空では登録できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "explanationが空では登録できない" do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "categoryが空では登録できない" do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "status_idが空では登録できない" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "shipping_fee_idが空では登録できない" do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it "shipping_prefecture_idが空では登録できない" do
      @item.shipping_prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping prefecture can't be blank")
    end
    it "shipping_day_idが空では登録できない" do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it "priceが空では登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが300円以下・9999999円以上だと登録できない" do
      @item.price = '299'
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it "priceが全角数字だと登録できない" do
      @item.price = "１２３４５"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
    end

  end
end
