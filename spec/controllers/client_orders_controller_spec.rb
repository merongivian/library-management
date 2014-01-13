require 'spec_helper'

describe ClientOrdersController do
  let!(:user) { FactoryGirl.create :user }

  before do
  	controller.stub(authenticate_user!: true)
  	controller.stub(current_user: user)
  end

  describe "GET 'index'" do
  	let!(:order) { FactoryGirl.create :order, user: user }

    it "returns a list with orders from a user" do
      order_manager = LibraryManagement::OrderManager.new order

      get :index

      LibraryManagement::OrderManager.stub(:transform_orders).with(user.orders) { [order_manager] }

      expect(assigns :client_orders).to eq [order_manager]
      # response.should be_success
    end
  end

end
