require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sessions/new" do
    before do
      get sessions_new_path
    end

    it 'ログイン画面の表示に成功すること' do
      expect(response).to be_successful
    end
  end
end