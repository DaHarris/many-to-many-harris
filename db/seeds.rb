# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



products = 10.times.map do
  {
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    company_id: (1..10).to_a.sample
  }

end

puts 'turn your sound on'

companies = 10.times.map do
  {
    name: Faker::Company.name,
    catch_phrase: Faker::Company.catch_phrase,
    suffix: Faker::Company.suffix

  }
end

users = 10.times.map do
  {
    name: Faker::Name.name,
    email: Faker::Internet.email
  }
end

users.each{|u| User.create(name: u[:name], email: u[:email])}

products.each do |p|
  Product.create(name: p[:name],  price: p[:price], company_id: p[:company_id])
end

companies.each do |p|
  Company.create(name: p[:name],  catch_phrase: p[:catch_phrase], suffix: p[:suffix])
end


` say "#{Faker::Hacker.say_something_smart} "`
