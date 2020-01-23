FactoryBot.define do

  factory :address do
    first_name              {"山田"}
    last_name              {"太郎"}
    first_name_kana              {"ヤマダ"}
    last_name_kana              {"タロウ"}
    phone_number             {"00000000000"}
    post_number              {"000-0000"}
    prefecture_id                {1}
    city                      {"春日部市"}
    address_number            {"000"}
    building                    {"春日部ビル"}
  end
end