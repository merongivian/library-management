require 'spec_helper'

describe OrdersController do
  let(:user) { FactoryGirl.create :user }

  before do
    controller.stub(authenticate_user!: true)
    controller.stub(current_user: user)
  end

  describe "POST 'create'" do
    let!(:book) { FactoryGirl.create :book }
    it "returns http success" do
      post :create, book_id: book.id

      expect(response).to redirect_to authors_path
    end
  end

  # describe "GET 'index'" do
  #   it "returns http success" do
  #     get 'index'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'update'" do
  #   it "returns http success" do
  #     get 'update'
  #     response.should be_success
  #   end
  # end

  # describe "DELETE'destroy'" do
  #   it "returns http success" do
  #     get 'destroy'
  #     response.should be_success
  #   end
  # end

end
