# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

emails = [
  'user1@gmail.fr',
  'user2@gmail.fr',
  'user3@gmail.fr',
  'user4@gmail.fr'
]

emails.each do |email|
  Tenant.create(email: email)
end

studios = [
  ['Studio1', 500],
  ['Studio2', 1000],
  ['Studio3', 2000],
  ['Studio4', 2650],
  ['Studio5', 30000]
]

studios.each do |name, price|
  Studio.create(name: name, monthly_price: price)
end



stays = [
  [Tenant.first, Studio.first, Date.new(2018, 12, 2), Date.new(2018, 12, 8)],
  [Tenant.first, Studio.second, Date.new(2019, 1, 2), Date.new(2019, 1, 5)],
  [Tenant.first, Studio.third, Date.new(2019, 1, 10), Date.new(2019, 3, 2)],
  [Tenant.first, Studio.find(4), Date.new(2019, 5, 1), Date.new(2019, 6, 1)],
  [Tenant.first, Studio.find(5), Date.new(2019, 8, 7), Date.new(2019, 8, 15)],
  [Tenant.second, Studio.first, Date.new(2019, 1, 1), Date.new(2019, 1, 30)],
  [Tenant.second, Studio.second, Date.new(2019, 3, 5), Date.new(2019, 7, 5)],
  [Tenant.second, Studio.third, Date.new(2019, 7, 1), Date.new(2019, 7, 2)],
  [Tenant.third, Studio.first, Date.new(2019, 10, 2), Date.new(2019, 11, 15)],
  [Tenant.third, Studio.second, Date.new(2019, 9, 6), Date.new(2019, 9, 18)],
  [Tenant.third, Studio.third, Date.new(2019, 3, 7), Date.new(2019, 4, 8)],
  [Tenant.third, Studio.find(4), Date.new(2019, 12, 12), Date.new(2019, 12, 20)]
]

stays.each do |tenant, studio, starts_at, ends_at|
  Stay.create(tenant: tenant, studio: studio, starts_at: starts_at, ends_at: ends_at)
end


