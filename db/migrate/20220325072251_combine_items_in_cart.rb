class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def change
  end
  def up
    # several items in the cart are displayed under single name
    Cart.all.each do |cart|
    # count item quantity in cart
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          # delete repeated records
          cart.line_items.where(product_id: product_id).delete_all
          # replace with single record
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
