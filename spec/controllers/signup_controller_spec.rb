require 'rails_helper'

describe SignupController do
  describe 'Post #create' do
    it "step1からstep2へ遷移できるか" do
      get :step2 
      expect(response).to render_template :step2
    end
    context 'step6からdoneへ遷移できるか' do
      it "step6までの情報が保存できているか" do
        user = create(:user) 
        address = create(:address)
        card = create(:card)
        post :create, params: {id: user}
        post :create, params: {id: address}
        post :create, params: {id: card}
        #idキーにuserバリューをセット
        # expect(assigns(:user)).to eq user #createアクションで定義しているインスタンス変数の名前は@userなので、assignsの引数に:use。
      end
      # it "step6からdoneまでのページへ遷移できるか" do
      #   user = create(:user)
      #   get :step3, params: { id: user }
      #   expect(response).to render_template :step3
      # end
    end


  end
end