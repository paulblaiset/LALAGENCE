# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Agency.destroy_all
User.destroy_all
Flat.destroy_all
Candidature.destroy_all
UrlFlat.destroy_all
puts "Agency, users, flats destroyed"

orpi = Agency.create!(
  name: 'Orpi Paris 14',
  address: 'Paris 14',
  mail: 'orpi@contact.com'
)

michel = User.new(
  email: 'michel@michel.com',
  password: 'password',
  gender: 'male',
  first_name: 'Michel',
  last_name: 'Michou',
  work_situation: 'SALARIÉ(E)',
  job_name: 'Entrepreneur',
  salary_by_month: '1800',
  first_day_of_work: '2017-12-01',
  birthday_date: '1990-08-12'
)
michel.agency = orpi
michel.save

marie = User.create!(
  email: 'marie@marie.com',
  password: 'password3',
  gender: 'femail',
  first_name: 'Marie',
  last_name: 'Claire',
  work_situation: 'SALARIÉ(E)',
  job_name: 'Chef de projet',
  salary_by_month: '3900',
  first_day_of_work: '2015-11-11',
  birthday_date: '1985-01-22'
)

marie.remote_employment_contract_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
marie.remote_identity_card_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528188730/IMG_1817.jpg"
marie.remote_pay_slip_1_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
marie.remote_pay_slip_2_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
marie.remote_pay_slip_3_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
marie.remote_actual_rent_bill_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
marie.remote_tax_notice_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"

marie.save


jack = User.create!(
  email: 'jack@jack.com',
  password: 'password',
  gender: 'male',
  first_name: 'Jack',
  last_name: 'Sparrow',
  work_situation: 'SALARIÉ(E)',
  job_name: 'Entrepreneur',
  salary_by_month: '1800',
  first_day_of_work: '2017-12-01',
  birthday_date: '1990-08-12'
  )
jack.remote_employment_contract_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
jack.remote_identity_card_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528188730/IMG_1817.jpg"
jack.remote_pay_slip_1_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
jack.remote_pay_slip_2_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
jack.remote_pay_slip_3_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
jack.remote_actual_rent_bill_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"
jack.remote_tax_notice_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"

jack.save

puts "Michel, Marie Jack created"

t2 = Flat.create!(
  name: 'Magnifique T2',
  nb_room: "2",
  address: "Paris 15",
  surface: "32m²",
  price: "1500€",
)
t2.agency = orpi
t2.remote_photo_url = "https://static.orpi.com/images/ac3-media/estate-v2-mobile/office6/orpi_73265/catalog/images/pr_p/5/0/3/3/9/2/0/5033920a--201802270035.jpg"
t2.save

t3 = Flat.create!(
  name: 'Magnifique T3',
  nb_room: "4",
  address: "Paris 16",
  surface: "42m²",
  price: "1000€",
)
t3.agency = orpi
t3.remote_photo_url = "https://static.orpi.com/images/ac3-media/estate-v2/office6/orpi_92306/catalog/images/pr_p/5/2/0/5/5/5/7/5205557a--201805251904.jpg"
t3.save

puts "2 flats created"

url = UrlFlat.new(
  url_1: "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/"
)
url.flat = t2
url.save

url2 = UrlFlat.new(
  url_1: "https://www.orpi.com/annonce-location-appartement-t2-paris-10-75010-b-e1267n/"
)
url2.flat = t3
url2.save

candidature_1 = Candidature.new(
  url: "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/",
)
candidature_1.user = michel
candidature_1.url_flat = url
candidature_1.save

candidature_2 = Candidature.new(
  url: "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/",)
candidature_2.user = jack
candidature_2.url_flat = url2
candidature_2.save

puts "2 candidatures created"

paul = Guarantor.new(
  first_name: 'Paul',
)
paul.user = michel
paul.save

puts "1 guarantor created"

