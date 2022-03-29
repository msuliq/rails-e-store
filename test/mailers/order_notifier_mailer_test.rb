require "test_helper"

class OrderNotifierMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifierMailer.received(orders(:one))
    assert_equal "Confirmation for your order at Rails E-Store", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["rails@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifierMailer.shipped(orders(:one))
    assert_equal "Your order from Rails E-Store is on the way", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["rails@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
