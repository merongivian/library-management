require 'spec_helper'

describe AuthorsController do

  describe "GET 'index'" do
  	let!(:author) { FactoryGirl.create :author }
  	let!(:oscar_wilde) { FactoryGirl.create :author }

    it "returns all authors" do
      get :index

      response.should be_success

      expect(assigns :authors).to match_array [oscar_wilde, author]
    end
  end

end
