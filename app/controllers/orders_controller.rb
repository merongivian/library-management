class OrdersController < AuthenticatedUsersController
  before_filter :set_book

  def create
  	@order = Order.new(user: current_user, book: @book)

  	if @order.save
      flash[:notice] = "Your order has been placed, now you have to come and pick it up on our library!"
    else
      flash[:alert] = "There has been an error placing your order"
    end

    redirect_to authors_path
  end

  def index
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(picked: params[:picked], picked_up_at: Date.current)
      flash[:notice] = "The order has picked"
    else
      flash[:alert] = "There was an error changind the order"
    end

    redirect_to section_orders_path
  end

  def destroy
    @order = Order.find(params[:id])

    if @order.destroy
      flash[:notice] = "The order has been removed"
    else
      flash[:alert] = "There was an error removing the order"
    end

    redirect_to section_orders_path
  end

  private

  def set_book
  	@book = Book.find(params[:book_id])
  end
end
