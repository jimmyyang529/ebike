class UserMailer < ApplicationMailer
  default :from => "Bike Your Life <info@bikeyourlife.com>"

  def notify_order_create(order)
    @order = order
    @content = "Your order is created. Thank you!"
      mail to: order.user.email,
      subject: "Bike Your Life | 訂單成立: #{@order.id}"
  end



end
