require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do
    @user = create(:user)
    @post = create(:post)
  end

  describe 'GET /posts/:id' do
    context 'ログインしていない場合' do
      it 'HTTPステータス200を返す' do
        get "/posts/#{@post.id}"
        expect(response).to have_http_status '200'
      end
    end
    context 'ログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @user
        get "/posts/#{@post.id}"
        expect(response).to have_http_status '200'
      end
    end
  end
end
