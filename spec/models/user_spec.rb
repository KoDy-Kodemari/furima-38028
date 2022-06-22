require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "同じemailは登録できない" do
      @user.save
      another_email = FactoryBot.build(:user)
      another_email.email = @user.email
      another_email.valid?
      expect(another_email.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@がないと登録できない" do
      @user.email = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end

    it "passwordが半角英字を含んでいないと登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it "passwordが半角数字を含んでいないと登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password = "000aaa"
      @user.password_confirmation = "111aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "last_name_kanjiが空だと登録できない" do
      @user.last_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end

    it "first_name_kanjiが空だと登録できない" do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanjiが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
      @user.last_name_kanji = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid. Input full-width characters")
    end

    it "last_name_kanjiが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
      @user.first_name_kanji = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid. Input full-width characters")
    end

    it "last_name_kanaが全角（カタカナ）以外だと登録できない" do
      @user.last_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
    end

    it "first_name_kanaが全角（カタカナ）以外だと登録できない" do
      @user.first_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
    end

    it "date_of_birthが空だと登録できない" do
      @user.date_of_birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end

  end
end