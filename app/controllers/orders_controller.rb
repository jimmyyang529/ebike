class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order("id DESC")
  end


  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.add_order_items(current_cart)
    @order.amount = current_cart.total

    if @order.save
      current_cart.destroy
      redirect_to order_path(@order), notice:'已成立訂單!'
      # UserMailer.notify_order_create(@order).deliver_now!
    else
      render :new
    end
  end


  def show
    @order = current_user.orders.find( params[:id] )
  end

  def checkout_pay2go
    @order = current_user.orders.find( params[:id] )

    if @order.paid?
      flash[:alert] = "你已經付過啦"
      redirecto_to order_path(@order)
    else
      @payment = Payment.create!( :order => @order,
                                  :payment_method => params[:payment_method],
                                  :amount => @order.amount )
      render :layout => false
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
