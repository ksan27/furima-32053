require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_readingとlast_name_reading、birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end


    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@があると登録できる" do
      @user.email = "abc@sample"
      expect(@user).to be_valid
    end


    it "passwordが空だと保存できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以上だと保存できる" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end
    it "passwordが5文字以下であれば保存できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字だと保存できる" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end
    it "passwordが全角英数字だと保存できない" do
      @user.password = "１２３４５６"
      @user.password_confirmation = "１２３４５６"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
    end
    it "passwordとpassword_confirmationが一致していないと保存できない" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it "first_nameが空だと保存できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと保存できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_readingが空だと保存できない" do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it "last_name_readingが空だと保存できない" do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end

    it "last_nameとlast_name_readingが全角だと保存できる" do
      @user.first_name = "山田"
      @user.first_name_reading = "ヤマダ"
      expect(@user).to be_valid
    end
    it "first_nameとfirst_name_readingが半角だと保存できない" do
      @user.first_name = "ﾔﾏﾀﾞ"
      @user.first_name_reading = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name First name Full-width characters")
    end

    it "last_nameとlast_name_readingが全角だと保存できる" do
      @user.last_name = "花子"
      @user.last_name_reading = "ハナコ"
      expect(@user).to be_valid
    end
    it "last_nameとlast_name_readingが半角だと保存できない" do
      @user.last_name = "ﾊﾅｺ"
      @user.last_name_reading = "ﾊﾅｺ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Last name Full-width characters")
    end

    it "birthdayが空だと保存できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
