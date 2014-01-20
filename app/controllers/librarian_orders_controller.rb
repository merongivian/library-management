class LibrarianOrdersController < AuthenticatedUsersController
  def index
  	# if current_user.librarian?
	  @section_orders = LibraryManagement::OrderManager.transform_orders(Order.by_section current_user.section)

	  # respond_to do |format|
	  #   format.html
	  #   format.json { render :json => @books }
	  # end
  	# end
  end
end
