require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it '必須項目が全て存在していれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("イメージを入力してください")
    end
    it 'nameが空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it 'explanationが空では登録できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("説明を入力してください")
    end
    it 'category_idがid1の時では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
    end
    it 'status_idがid1の時では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
    end
    it 'shipping_fee_idがid1の時では登録できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料は1以外の値にしてください')
    end
    it 'shipping_prefecture_idがid1の時では登録できない' do
      @item.shipping_prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送地域は1以外の値にしてください')
    end
    it 'shipping_day_idがid1の時では登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送日数は1以外の値にしてください')
    end
    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end
    it 'priceが300円以下だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は範囲外です')
    end
    it 'priceが9999999円以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は範囲外です')
    end
    it 'priceが全角数字だと登録できない' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は半角数字で入力してください')
    end
  end
end
