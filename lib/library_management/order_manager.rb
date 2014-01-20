module LibraryManagement
  class OrderManager

  	attr_reader :name, :id, :order_date, :pick_date, :penalty, :picked

  	def initialize(order)
  	  @name = order.book.name
  	  @order_date = order.created_at

  	  @pick_date = if order.picked_up_at
        order.picked_up_at
      else
      	calculate_pick_date(order.created_at)
      end

      @penalty = order.book.penalty
      @picked  = order.picked
      @id = order.id
      @pick_days = order.pick_days
      @loan_days = order.loan_days
  	end

  	def self.transform_orders(orders)
      orders.map do |order|
      	OrderManager.new order
      end
  	end

  	def days_left_to_pick
  	  (@pick_date - Date.current).to_i
  	end

  	def days_left_to_return
  	  (calculate_return_date - Date.current).to_i
  	end

  	def never_picked?
  	  !still_has_days_left_to_pick? && !@picked
  	end

   	def never_returned?
  	  days_left_to_return <= 0
  	end

  	def status
  	  if never_picked?
        "never picked up"
  	  else
  	  	if !still_has_days_left_to_pick?
          never_returned? ? "never returned" :  "#{days_left_to_return} days left to return"
        else
          "#{days_left_to_pick} days left to pick"
        end
  	  end
  	end

    def total_penalty
      if @picked && never_returned?
        @penalty * days_left_to_return.abs
      end
    end

    def ==(order_manager)
  	  self.name == order_manager.name
  	end

  	private

  	def calculate_pick_date(start_date)
      start_date + PICK_DAYS
    end

    def calculate_return_date
      @pick_date + LOAN_DAYS
    end

    def still_has_days_left_to_pick?
      days_left_to_pick > 0
    end
  end
end
