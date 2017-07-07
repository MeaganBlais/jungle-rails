class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def send_order_email(order_id)
    @order = Order.find_by(id: order_id)
    mail(to: @order.email, subject: "Order Success! Order ID:#{@order.id}")
  end
  helper_method :send_order_email
end
