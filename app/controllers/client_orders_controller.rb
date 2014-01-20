class ClientOrdersController < AuthenticatedUsersController
  def index
  	@client_orders = LibraryManagement::OrderManager.transform_orders current_user.orders

  	# respond_to do |format|
   #    format.html
   #    format.json { render :json => @client_orders }
   #  end
  end
end
