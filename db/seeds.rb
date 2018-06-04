# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


orpi = Agency.create!(
  name: 'Orpi Paris 14',
  address: 'Paris 14',
  mail: 'orpi@contact.com'
)

michel = User.create!(
  email: 'michel@michel.com',
  password: 'password',
  gender: 'male',
  first_name: 'Michel',
  last_name: 'Michou',
  agency_id: 1,
  work_situation: 'SALARIÉ(E)',
  job_name: 'Entrepreneur',
  salary_by_month: '1800',
  first_day_of_work: '2017-12-01',
  birthday_date: '1990-08-12'
)

marie = User.create!(
  email: 'marie@marie.com',
  password: 'password3',
  gender: 'femail',
  first_name: 'Marie',
  last_name: 'Claire',
  agency_id: 1,
  work_situation: 'SALARIÉ(E)',
  job_name: 'Chef de projet',
  salary_by_month: '3900',
  first_day_of_work: '2015-11-11',
  birthday_date: '1985-01-22'
)

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

t2 = Flat.new(
  name: 'Magnifique T2',
  agency_id: 1,
  nb_room: "2",
  address: "Paris 15",
  surface: "32m²",
  price: "1500€",
)

t3 = Flat.create!(
  name: 'Magnifique T3',
  agency_id: 1,
  nb_room: "4",
  address: "Paris 16",
  surface: "42m²",
  price: "1000€",
)

t2.remote_photo_url = "https://static.orpi.com/images/ac3-media/estate-v2-mobile/office6/orpi_73265/catalog/images/pr_p/5/0/3/3/9/2/0/5033920a--201802270035.jpg"

t2.save

t3.remote_photo_url = "https://static.orpi.com/images/ac3-media/estate-v2/office6/orpi_92306/catalog/images/pr_p/5/2/0/5/5/5/7/5205557a--201805251904.jpg"

t3.save

url = UrlFlat.create!(
  url_1: "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/",
  flat_id: 1,
)

url2 = UrlFlat.create!(
  url_1: "https://www.orpi.com/annonce-location-appartement-t2-paris-10-75010-b-e1267n/",
  flat_id: 2,
)

candidature_1 = Candidature.create!(
  user_id: 3,
  url: "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/",
  url_flat_id: 1
)

candidature_2 = Candidature.create!(
  user_id: 3,
  url_flat_id: 2
)

paul = Guarantor.create!(
  first_name: 'Paul',
  user_id: 1
)


