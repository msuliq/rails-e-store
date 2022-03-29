class OrderNotifierMailer < ApplicationMailer

  default from: 'Sam Ruby <rails@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Confirmation for your order at Rails E-Store'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Your order from Rails E-Store is on the way'
  end
end
