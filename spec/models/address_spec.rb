require 'rails_helper'


#新規登録
describe Address do #Addressモデルのテストグループ
  describe '#create' do #createアクションのテストグループ

#1.first_name, last_name, first_name_kana, last_name_kana, phone_number, post_number, prefecture, city, address_number, buildingが存在すれば登録できること
    it "is valid with a.first_name, last_name, first_name_kana, last_name_kana, phone_number, post_number, prefecture, city, address_number, building" do
      address = build(:address)
      expect(address).to be_valid
    end


#2.first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("can't be blank")
    end

#3.last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("can't be blank")
    end
#4.first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("can't be blank")
    end
#5.last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana" do
      address = build(:address, last_name_kana: nil)
      address.valid?
      expect(address.errors[:last_name_kana]).to include("can't be blank")
    end

#6.phone_numberが空では登録できないこと
    it "is invalid without a phone_number" do
      address = build(:address, phone_number: nil)
      address.valid?
      expect(address.errors[:phone_number]).to include("can't be blank")
    end
#7.post_numberが空では登録できないこと
    it "is invalid without a post_number" do
      address = build(:address, post_number: nil)
      address.valid?
      expect(address.errors[:post_number]).to include("can't be blank")
    end
#8.prefecture_idが空では登録できないこと
    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end
#9.cityが空では登録できないこと
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end
#10.address_numberが空では登録できないこと
    it "is invalid without a address_number" do
      address = build(:address, address_number: nil)
      address.valid?
      expect(address.errors[:address_number]).to include("can't be blank")
    end
    #11.buildingが空では登録できないこと
    it "is invalid without a building" do
      address = build(:address, building: nil)
      address.valid?
      expect(address.errors[:building]).to include("can't be blank")
    end
  end
end