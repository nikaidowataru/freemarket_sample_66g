require 'rails_helper'


#新規登録
describe Card do #Cardモデルのテストグループ
  describe '#create' do #createアクションのテストグループ

#1.card_number, :limit_month, :limit_year, :security_codeが存在すれば登録できること
    it "is invalid with a card_number, limit_month, limit_year, security_code" do
      card = build(:card)
      expect(card).to be_valid
    end


#2.card_numberが空では登録できないこと
    it "is invalid without a card_number" do
      expect(FactoryBot.build(:card, card_number: "")).to_not be_valid 
    end

#3.limit_monthが空では登録できないこと
    it "is invalid without a limit_month" do
      expect(FactoryBot.build(:card, limit_month: "")).to_not be_valid 
    end
#4.limit_yearが空では登録できないこと
    it "is invalid without a limit_year" do
      expect(FactoryBot.build(:card, limit_year: "")).to_not be_valid 
    end
#5.security_codeが空では登録できないこと
    it "is invalid without a security_code" do
      expect(FactoryBot.build(:card, security_code: "")).to_not be_valid 
    end
  end
end