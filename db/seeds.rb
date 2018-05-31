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
  agency_id: 1
)

jack = User.create!(
  email: 'jack@jack.com',
  password: 'password',
  gender: 'male',
  first_name: 'Jack',
  last_name: 'Sparrow',
  )

t2 = Flat.create!(
  name: 'Magnifique T2',
  agency_id: 1,
  nb_room: "2",
  address: "Paris 15",
  surface: "32m²",
  price: "1500€"
)

url = UrlFlat.create!(
  url_1: "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/",
  flat_id: 1
)

candidature_1 = Candidature.create!(
  user_id: 1,
  url_flat_id: 1
)

paul = Guarantor.create!(
  first_name: 'Paul',
  user_id: 1
)



