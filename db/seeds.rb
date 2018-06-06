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
Guarantor.destroy_all
puts "Agency, users, flats, guarantor, destroyed"

orpi = Agency.create!(
  name: 'Orpi Paris 14',
  address: 'Paris 14',
  mail: 'orpi@contact.com'
)

michel = User.new(
  email: 'michel@orpi.com',
  password: 'password',
  gender: 'male',
  first_name: 'Michel',
  last_name: 'Dubois',
  work_situation: 'SALARIÉ(E)',
  job_name: 'Entrepreneur',
  salary_by_month: '1800',
  first_day_of_work: '2017-12-01',
  birthday_date: '1990-08-12'
)
michel.agency = orpi
michel.save


paul = User.create!(
  email: 'paul.blaiset@gmail.com',
  password: 'password',
  gender: 'male',
  first_name: 'Paul Henri',
  last_name: 'BLAISET',
  work_situation: 'SALARIÉ(E)',
  job_name: 'Developpeur',
  salary_by_month: '2800 €',
  first_day_of_work: '2017-12-01',
  birthday_date: '1988-10-11',
  actual_rent_price: '1690€',
  rental_status: 'Locataire',
  )

paul.remote_identity_card_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201886/ID_Recto.jpg"
paul.remote_employment_contract_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201614/contrat-de-travail-CDI_all.jpg"
paul.remote_pay_slip_1_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_1_all.pdf"
paul.remote_pay_slip_2_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_2_all.pdf"
paul.remote_pay_slip_3_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_3_all.pdf"
paul.remote_actual_rent_bill_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/Quittance-de-loyer_all.jpg"
paul.remote_tax_notice_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"

paul.save


marie = User.create!(
  email: 'marie@marie.com',
  password: 'password',
  gender: 'female',
  first_name: 'Marie',
  last_name: 'Claire',
  work_situation: 'Profession Libérale',
  job_name: 'Chef entreprise',
  salary_by_month: '4900 €',
  first_day_of_work: '2015-11-11',
  birthday_date: '1985-01-22',
  actual_rent_price: '1000€',
  rental_status: 'Locataire',
)

marie.remote_identity_card_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/ID_3_F.jpg"
marie.remote_employment_contract_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201614/contrat-de-travail-CDI_all.jpg"
marie.remote_pay_slip_1_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_1_all.pdf"
marie.remote_pay_slip_2_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_2_all.pdf"
marie.remote_pay_slip_3_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_3_all.pdf"
marie.remote_actual_rent_bill_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/Quittance-de-loyer_all.jpg"
marie.remote_tax_notice_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"

marie.save




jack = User.create!(
  email: 'jack@jack.com',
  password: 'password',
  gender: 'male',
  first_name: 'Jack',
  last_name: 'DUPONT',
  work_situation: 'SALARIÉ(E)',
  job_name: 'Plombier',
  salary_by_month: '2800 €',
  first_day_of_work: '2017-12-01',
  birthday_date: '1988-10-11',
  actual_rent_price: '1120€',
  rental_status: 'Locataire',
  )

jack.remote_identity_card_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201614/ID_2.jpg"
jack.remote_employment_contract_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201614/contrat-de-travail-CDI_all.jpg"
jack.remote_pay_slip_1_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_1_all.pdf"
jack.remote_pay_slip_2_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_2_all.pdf"
jack.remote_pay_slip_3_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_3_all.pdf"
jack.remote_actual_rent_bill_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/Quittance-de-loyer_all.jpg"
jack.remote_tax_notice_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"

jack.save

puts "Paul Marie et Jack created"


f3= Flat.create!(
  name: 'F3 de charme / Quartier animé ',
  nb_room: "3",
  address: "Paris 18",
  surface: "49m²",
  price: "1650€",
)
f3.agency = orpi
f3.remote_photo_url = "https://static.orpi.com/images/ac3-media/estate-v2/office6/orpi_72962/catalog/images/pr_p/5/1/6/2/5/9/0/5162590a--201805281949.jpg"
f3.save

f2= Flat.create!(
  name: 'F2 superbe état',
  nb_room: "2",
  address: "Paris 12",
  surface: "41m²",
  price: "1165€",
)
f2.agency = orpi
f2.remote_photo_url = "https://static.orpi.com/images/ac3-media/estate-v2/office6/orpi_105014/catalog/images/pr_p/5/2/2/3/8/1/5/5223815a--201806051425.jpg"
f2.save

f32= Flat.create!(
  name: 'F2 atypique dans le 12eme ',
  nb_room: "2",
  address: "Paris 20",
  surface: "67m²",
  price: "1520€",
)
f32.agency = orpi
f32.remote_photo_url = "https://static.orpi.com/images/ac3-media/default/office6/orpi_73512/catalog/images/pr_p/4/1/4/5/2/3/4/4145234a--201607261354.jpg"
f32.save


t2 = Flat.create!(
  name: 'T2 d exception',
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

puts "5 flats created"



#FLAT URL ------------------------------------

urlf3 = UrlFlat.new(
  url_1: "https://www.orpi.com/annonce-location-appartement-t3-paris-18-75018-b-e11kw0/"
)
urlf3.flat = f3
urlf3.save


urlf2 = UrlFlat.new(
  url_1: "https://www.orpi.com/annonce-location-appartement-t2-paris-12-75012-b-e12gz5/"
)
urlf2.flat = f2
urlf2.save


urlf32 = UrlFlat.new(
  url_1: "https://www.orpi.com/annonce-location-appartement-t3-paris-20-75020-b-e0jyf7/"
)
urlf32.flat = f32
urlf32.save


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


# CANDIDATURES -----------------


candidature_1 = Candidature.new(
  url: "https://www.orpi.com/annonce-location-appartement-t3-paris-20-75020-b-e0jyf7/",
  commentaire: "Pour colocation"
)
candidature_1.user = paul
candidature_1.url_flat = urlf32
candidature_1.save

candidature_2 = Candidature.new(
  url: "https://www.orpi.com/annonce-location-appartement-t3-paris-20-75020-b-e0jyf7/",
  commentaire: "Pour famille 3 personnes"
  )
candidature_2.user = marie
candidature_2.url_flat = urlf32
candidature_2.save

candidature_3 = Candidature.new(
  url: "https://www.orpi.com/annonce-location-appartement-t3-paris-20-75020-b-e0jyf7/",
  commentaire: "Pour personne seule"
  )
candidature_3.user = jack
candidature_3.url_flat = urlf32
candidature_3.save

candidature_4 = Candidature.new(
  url: "https://www.orpi.com/annonce-location-appartement-t2-paris-10-75010-b-e1267n/",
  commentaire: "J'ai un chien")
candidature_4.user = paul
candidature_4.url_flat = url2
candidature_4.save

candidature_5 = Candidature.new(
  url: "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/",
  commentaire: "J'ai un chat")
candidature_5.user = paul
candidature_5.url_flat = url
candidature_5.save


puts "5 candidatures created"


alfred = Guarantor.new(

  gender: 'Male',
  first_name: 'Alfred',
  last_name: 'Melot',
  job_name: 'Peintre',
  address: "29 boulevard de grenelle - 75015 Paris",
  year_legal_income: '50000 €',
  couple_status: 'O',
  birthday_date: '1990-08-12',
  nationality: 'Francaise',
  mail: 'alfred@pigeonvoyageur.fr',
  child_number: '6',
  employer_address: "3 rue de la république - 75011 Paris",
  employer_phone_number: "01 18 30 46 17",
  actual_rent_price: '1800€',
  seniority:'12ans',
  rental_status:'Proprietaire',
)

alfred.remote_identity_card_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/ID_guarant1_all.jpg"
alfred.remote_employment_contract_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201614/contrat-de-travail-CDI_all.jpg"
alfred.remote_pay_slip_1_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_1_all.pdf"
alfred.remote_pay_slip_2_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_2_all.pdf"
alfred.remote_pay_slip_3_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/bulletin_3_all.pdf"
alfred.remote_actual_rent_bill_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528201615/Quittance-de-loyer_all.jpg"
alfred.remote_tax_notice_url = "http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"

alfred.user = paul
alfred.save!


puts "1 guarantor created"

