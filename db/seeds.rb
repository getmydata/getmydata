# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.destroy_all

companies = Company.create!([{ name: 'Booking.com', email: 'customer.service@booking.com', url: 'https://www.booking.com/', category: 'Living'},
{ name: 'Tomtom', email: 'support@tomtom.com', url: 'https://www.tomtom.com/', category: 'Education'},
{ name: 'ABN AMRO', email: 'support@abnamro.com', url: "https://www.abnamro.nl/", category: 'Bank' },
{ name: 'Albert Heijn', email: 'support@ablertheijn.com', url: 'https://www.ah.nl/', category: 'Living'},
{ name: 'KLM', email: 'onlinesupport@klm.com', url: 'https://www.klm.com', category: 'Living'},
{ name: 'Philips', email: 'support@philips.com', url: 'https://www.philips.nl', category: 'Energy'}])
