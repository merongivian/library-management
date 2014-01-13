class LibrarianOrdersController < AuthenticatedUsersController
  def index
  	if current_user.librarian?
	  @section_orders = LibraryManagement::OrderManager.transform_orders(Order.by_section current_user.section)
  	end
  end
end
