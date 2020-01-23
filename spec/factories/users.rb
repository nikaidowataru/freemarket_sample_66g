FactoryBot.define do

  factory :user do
    
    nickname              {"aaa"}
    email               {"kkk@gmail.com"}
    password              {"00000000"}
    # password_confirmation {"00000000"}
    first_name              {"山田"}
    last_name              {"太郎"}
    first_name_kana              {"ヤマダ"}
    last_name_kana              {"タロウ"}
    birth_year              {"2020"}
    birth_month              {"1"}
    birth_day              {"1"}
    phone_number             {"00000000000"}
  end

end