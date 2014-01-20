class AuthorBooksForClientsController < AuthenticatedUsersController
  before_filter :set_author

  def index
  	@books = @author.books

    respond_to do |format|
      format.html
      format.json { render :json => @books }
    end
  end

  private

  def set_author
  	@author = Author.find(params[:author_id])
  end
end
