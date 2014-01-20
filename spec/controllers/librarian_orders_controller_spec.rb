require 'spec_helper'

describe LibrarianOrdersController do

  describe "GET 'index'" do
    it "returns http success" do
      get :index

      user = FactoryGirl.create :user, :librarian

      sign_in user

      puts "--------------------#{current_user.section}-------------------------"
      response.should be_success
    end
  end

end
