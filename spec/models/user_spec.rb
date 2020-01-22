require 'rails_helper'


#新規登録
describe User do #Userモデルのテストグループ
  describe '#create' do #createアクションのテストグループ

#1.nickname, email, password, first_name, last_name, first_name_kana, last_name_kana, birth_year, birth_month, birth_day, phone_numberが存在すれば登録できること
    it "is invalid with a nickname, email, password, first_name, last_name, first_name_kana, last_name_kana, birth_year, birth_month, birth_day, phone_number" do
      user = build(:user)
      expect(user).to be_valid
    end


#2.nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      expect(FactoryBot.build(:user, nickname: "")).to_not be_valid 
    end

#3.emailが空では登録できないこと
    it "is invalid without a email" do
      expect(FactoryBot.build(:user, email: "")).to_not be_valid 
    end
#4.passwordが空では登録できないこと
    it "is invalid without a password" do
      expect(FactoryBot.build(:user, password: "")).to_not be_valid 
    end
#5.first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      expect(FactoryBot.build(:user, first_name: "")).to_not be_valid 
    end
#6.last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      expect(FactoryBot.build(:user, last_name: "")).to_not be_valid 
    end
#7.first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      expect(FactoryBot.build(:user, first_name_kana: "")).to_not be_valid 
    end
#8.last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana" do
      expect(FactoryBot.build(:user, last_name_kana: "")).to_not be_valid 
    end
#9.birth_yearが空では登録できないこと
    it "is invalid without a birth_year" do
      expect(FactoryBot.build(:user, birth_year: "")).to_not be_valid 
    end
#10.birth_monthが空では登録できないこと
    it "is invalid without a birth_month" do
      expect(FactoryBot.build(:user, birth_month: "")).to_not be_valid 
    end
#11.birth_dayが空では登録できないこと
    it "is invalid without a birth_day" do
      expect(FactoryBot.build(:user, birth_day: "")).to_not be_valid 
    end

#12.重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do 
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

#13.passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000")
      user.valid?
      expect(user).to be_valid
    end
#14.passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end


#15.重複した携帯番号が存在する場合登録できないこと
    it "is invalid with a duplicate phone number" do 
      user = create(:user)
      another_user = build(:user, phone_number: user.phone_number)
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("has already been taken")
    end
  end
end