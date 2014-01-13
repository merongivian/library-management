require 'spec_helper'

describe AuthorBooksForClientsController do

  before do
  	controller.stub(authenticate_user!: true)
  	controller.stub(current_user: double('user'))
  end

  describe "GET 'index'" do
  	let!(:author) { FactoryGirl.create :author }

  	let!(:dorian_gray) { FactoryGirl.create :book, name: "Dorian Gray", author: author }
  	let!(:short_stories) { FactoryGirl.create :book, name: "Short Stories", author: author  }

    it "returns an array with books from an author" do
      get :index, author_id: author.id

      response.should be_success

      expect(assigns :books).to match_array [short_stories, dorian_gray]
    end
  end
end
