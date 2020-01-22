require 'rails_helper'


#新規登録
describe Address do #Addressモデルのテストグループ
  describe '#create' do #createアクションのテストグループ

#1.first_name, last_name, first_name_kana, last_name_kana, phone_number, post_number, prefecture, city, address_number, buildingが存在すれば登録できること
    it "is invalid with a first_name, last_name, first_name_kana, last_name_kana, phone_number, post_number, prefecture, city, address_number, building" do
      address = build(:address)
      expect(address).to be_valid
    end


#2.first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      expect(FactoryBot.build(:address, first_name: "")).to_not be_valid 
    end

#3.last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      expect(FactoryBot.build(:address, last_name: "")).to_not be_valid 
    end
#4.first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      expect(FactoryBot.build(:address, first_name_kana: "")).to_not be_valid 
    end
#5.last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana" do
      expect(FactoryBot.build(:address, last_name_kana: "")).to_not be_valid 
    end

#6.phone_numberが空では登録できないこと
    it "is invalid without a phone_number" do
      expect(FactoryBot.build(:address, phone_number: "")).to_not be_valid 
    end
#7.post_numberが空では登録できないこと
    it "is invalid without a post_number" do
      expect(FactoryBot.build(:address, post_number: "")).to_not be_valid 
    end
#8.prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      expect(FactoryBot.build(:address, prefecture: "")).to_not be_valid 
    end
#9.cityが空では登録できないこと
    it "is invalid without a city" do
      expect(FactoryBot.build(:address, city: "")).to_not be_valid 
    end
#10.address_numberが空では登録できないこと
    it "is invalid without a address_number" do
      expect(FactoryBot.build(:address, address_number: "")).to_not be_valid 
    end
#11.buildingが空では登録できないこと
    it "is invalid without a building" do
      expect(FactoryBot.build(:address, building: "")).to_not be_valid 
    end
  end
end