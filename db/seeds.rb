# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.delete_all
#
Product.create!(title:'Programming Ruby 1.9 & 2.0',
description:
%{<p>
    Ruby is the fastest growing and most exciting dynamic language 
    out there.
</p>},
image_url: 'ruby.jpg',
price: 49.99)
#