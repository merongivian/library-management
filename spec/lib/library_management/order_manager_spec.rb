require 'spec_helper'

describe LibraryManagement::OrderManager do
  let(:book_double) { double('book_double', name: "Hello Book", penalty: 3.4) }
  let(:order_double) { double('order_date', picked_up_at: nil, created_at: 3.days.ago.to_date, book: book_double, picked: false, id: 3) }
  let(:order_manager_instance) { LibraryManagement::OrderManager.new order_double }

  describe ".transform_orders" do
  	let!(:user) { FactoryGirl.create :user }

  	let!(:don_quijote) { FactoryGirl.create :book, name: "Don Quijote" }
  	let!(:el_zorro) { FactoryGirl.create :book, name: "El Zorro" }

  	let!(:first_order) { FactoryGirl.create :order, user: user, book: don_quijote }
  	let!(:second_order) { FactoryGirl.create :order, user: user, book: el_zorro }

  	it "transforms a list of orders to order managers" do
      order_manager_list = LibraryManagement::OrderManager.transform_orders(user.orders)
      order_manager_list_attributes = order_manager_list.map { |order_manager| order_manager.name }

      expect(order_manager_list_attributes).to match_array ["Don Quijote", "El Zorro"]
  	end
  end

  describe "#initialize" do
  	it "creates an order manager from an order" do
  	  book = FactoryGirl.create :book, name: "The choosen one", penalty: 30.8
  	  order = FactoryGirl.create :order, created_at: 5.days.ago.to_date, picked_up_at: Date.current, book: book

  	  order_manager = LibraryManagement::OrderManager.new order

      expect(order_manager.name).to eq "The choosen one"
  	  expect(order_manager.order_date).to eq 5.days.ago.to_date
  	  expect(order_manager.pick_date).to eq Date.current
  	  expect(order_manager.penalty).to eq 30.8
  	  expect(order_manager.picked).to eq false
  	end

  	it "calculates the pick date if not given" do
      expect(order_manager_instance.pick_date).to eq 4.days.from_now.to_date
  	end
  end

  describe "#days_left_to_pick" do
  	it "returns the days left for picking the book" do
  	  expect(order_manager_instance.days_left_to_pick).to eq 4
  	end
  end

  describe "#days_left_to_return" do
  	it "returns days left to return the book if it has been picked" do
  	  order_double.stub(:picked) { true }
  	  order_double.stub(:picked_up_at) { 10.days.ago.to_date }

  	  expect(order_manager_instance.days_left_to_return).to eq 18
    end
  end

  describe "#never_picked?" do
  	it "returns true if not picked and #days_left_to_pick is <= zero" do
  	  order_double.stub(:created_at) { 10.days.ago.to_date }

  	  expect(order_manager_instance).to be_never_picked
  	end

  	it "returns false if picked or still has days to pick the book" do
  	  expect(order_manager_instance).to_not be_never_picked
  	end
  end

  describe "#never_returned" do
  	it "returns true if #days_left_to_return is <= zero" do
  	  order_double.stub(:picked_up_at) { 50.days.ago.to_date }

  	  expect(order_manager_instance).to be_never_returned
  	end

  	it "retuns false if still has days to return the book" do
  	  expect(order_manager_instance).to_not be_never_returned
  	end
  end

  describe "#status" do
  	it "returns days until pick status if not picked yet" do
  	  expect(order_manager_instance.status).to eq "4 days left to pick"
  	end

    it "returns days until return if not returned yet" do
      order_double.stub(:picked) { true }
  	  order_double.stub(:picked_up_at) { 10.days.ago.to_date }

  	  expect(order_manager_instance.status).to eq "18 days left to return"
  	end

  	it "returns never returned if that's true" do
  	  order_double.stub(:picked) { true }
      order_double.stub(:picked_up_at) { 50.days.ago.to_date }

      expect(order_manager_instance.status).to eq "never returned"
  	end

  	it "returns never picked if that's true" do
  	  order_double.stub(:created_at) { 10.days.ago.to_date }

  	  expect(order_manager_instance.status).to eq "never picked up"
  	end
  end

  describe "#total_penalty" do
  	it "returns the total penalty if picked and never returned" do
  	  order_double.stub(:picked) { true }
      order_double.stub(:picked_up_at) { 50.days.ago.to_date }

      expect(order_manager_instance.total_penalty).to eq 74.8
  	end
  end
end