require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be a positive integer" do
    product = Product.new(title: "My book",
                          description: "lorem ipsum",
                          image_url: "zzz.png")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"]

    product.errors[:price]
    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"]

    product.errors[:price]
    product.price = 1
    assert product.invalid?
  end

  def new_product(image_url)
    Product.new(  title: "My book",
                  description: "lorem ipsum",
                  price: 1,
                  image_url: image_url)
  end
    
  test "image_url" do 
      ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
              http://a.b.c./x/y/z/fred.gif }
      bad = %w{ fred.doc fred.gif/more fred.gif.more }
      ok.each do |name|
        assert new_product(name).valid?, "#{name} should not be invalid."
      end
      bad.each do |name|
        assert new_product(name).invalid? "#{name} should not be valid."
      end
  end
  
  test "product is not valid without unique title - i18n" do
    product = Product.new(title: products(:ruby).title,
      description: "lorem ipsum",
      price: 1,
      image_url: "fred.gif")
      assert product.invalid? 
      assert_equal [I18n.translate('activerecord.error.messages.taken')], product.errors[:title]
  end
end