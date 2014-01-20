class AuthorsController < ApplicationController
  def index
  	@authors = Author.all

  	respond_to do |format|
      format.html
      format.json { render :json => @authors }
    end
  end
end
