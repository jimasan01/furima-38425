require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
end

  describe '商品の出品登録' do
    context '出品登録ができる場合' do
      it '必須項目が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @item.state_id = 2
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @item.postage_id = 2
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @item.area_id = 2
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @item.sipping_day_id = 2
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品ができない場合' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
      end
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank", 'State is not a number')
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank", 'Postage is not a number')
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it '発送元の地域の情報が空欄だと出品できない' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.sipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sipping day must be other than 1')
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @item.sipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping day can't be blank", 'Sipping day is not a number')
      end
      it '価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end