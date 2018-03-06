# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.destroy_all

companies = Company.create!([{ name: 'booking.com', email: 'customer.service@booking.com', avatar: 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/9634cf4370615.560c988391020.png', url: 'https://www.booking.com/'},
{ name: 'tomtom', email: 'support@tomtom.com', avatar: 'https://s1.cdn.autoevolution.com/images/news/tomtom-vows-to-reduce-traffic-congestion-35226_1.jpg', url: 'https://www.tomtom.com/'},
{ name: 'ABN AMRO', email: 'support@abnamro.com', avatar: "https://www.dwglogo.com/wp-content/uploads/2016/07/1300px_ABN_AMRO_logo.png", url: "https://www.abnamro.nl/" },
{ name: 'Albert Heijn', email: 'support@ablertheijn.com', avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Albert_Heijn_Logo.svg/2000px-Albert_Heijn_Logo.svg.png", url: 'https://www.ah.nl/'},
{ name: 'KLM', email: 'onlinesupport@klm.com', avatar: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/KLM_logo.svg/2000px-KLM_logo.svg.png', url: 'https://www.klm.com'},
{ name: 'philips', email: 'support@philips.com', avatar: 'http://www.newscenter.philips.com/pwc_nc/main/standard/resources/corporate/press/2013/Brand/Philips-Shield.jpg', url: 'https://www.philips.nl'}])


# 100.times do
#   user = User.new(
#     email: Faker::Internet.email,
#     encrypted_password: Faker::Internet.password(8),
#     first_name: Faker::Internet.user_name(8),
#     last_name: Faker::Internet.user_name(10)
#     )
#   user.save!
# end

