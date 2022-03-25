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

  def down
    # separate records with quantity>1 to several records
    LineItem.where("quantity>1").each do |line_item|
      # add individual items
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id,
        product_id: line_item.product_id, quantity: 1
      end
    # delete the initial record
    line_item.destroy
    end
  end
end