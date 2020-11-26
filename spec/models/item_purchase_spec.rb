require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  context '商品購入ができる時' do
    it '必須項目がすべて入力されていれば保存できる' do
      expect(@item_purchase).to be_valid
    end
    it 'building_nameは空でも保存できる' do
      @item_purchase.building_name = nil
      expect(@item_purchase).to be_valid
    end
  end

  context '商品購入ができない時' do
    it 'postal_codeが空では保存できない' do
      @item_purchase.postal_code = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'prefecture_idがid1の時では保存できない' do
      @item_purchase.prefecture_id = 1
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
    end
    it 'cityが空では保存できない' do
      @item_purchase.city = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空では保存できない' do
      @item_purchase.house_number = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空では保存できない' do
      @item_purchase.phone_number = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが11桁未満の場合保存できない' do
      @item_purchase.phone_number = '080'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Phone number Input only number')
    end
    it 'phone_numberが12桁以上の場合保存できない' do
      @item_purchase.phone_number = '080123456789'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Phone number Input only number')
    end
    it 'phone_numberが全角数字だと保存できない' do
      @item_purchase.phone_number = '０８０１２３４５６７８'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Phone number Input only number')
    end
    it 'postal_codeにハイフンが入っていない場合保存できない' do
      @item_purchase.postal_code = '1234567'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'postal_codeが3桁-4桁の数字ではない場合保存できない' do
      @item_purchase.postal_code = '1234-567'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'postal_codeが全角数字だとと保存できない' do
      @item_purchase.postal_code = '１２３ー４５６７'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'tokenが空では保存できない' do
      @item_purchase.token = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
