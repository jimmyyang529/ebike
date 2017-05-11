class OrdersController < ApplicationController
  before_action :authenticate_user!




  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.add_order_items(current_cart)
    @order.amount = current_cart.total

    if @order.save
      current_cart.destroy
      redirect_to root_path, notice:'已成立訂單!'
      UserMailer.notify_order_create(@order).deliver_now!
    else
      render :new
    end
  end


  protected

  def order_params
    params.require(:order).permit(:name,
                                  :email,
                                  :phone,
                                  :address,
                                  :payment_method
                                  )
  end

  def item_params
		params.require(:item).permit(
      :id,
			:name,
			:img_url,
			:manufacture_year,
			:frame,
			:fork,
      :size,
      :color,
      :price,
      :description,
      :brand_id,
      :category_id,
      :is_check
			)
	end




end
