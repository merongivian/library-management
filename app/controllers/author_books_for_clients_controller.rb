class AuthorBooksForClientsController < AuthenticatedUsersController
  before_filter :set_author

  def index
  	@books = @author.books
  end

  private

  def set_author
  	@author = Author.find(params[:author_id])
  end
end
