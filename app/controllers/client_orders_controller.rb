class ClientOrdersController < AuthenticatedUsersController
  def index
  	@client_orders = LibraryManagement::OrderManager.transform_orders current_user.orders
  end
end
