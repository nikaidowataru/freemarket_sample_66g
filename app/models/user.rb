class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  validates :nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day, :phone_number, presence: true
  
  validates :email, uniqueness: true

  validates :password, length: { minimum: 7}

  validates :phone_number, uniqueness: true,
                           format: {with: /\A[0-9-]{,14}\z/}



  has_many :items
  has_many :likes
  has_many :values
  has_one :address
  accepts_nested_attributes_for :address
  has_one :card
  accepts_nested_attributes_for :card
  has_many :sns_credentials
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
      user
  end
end
