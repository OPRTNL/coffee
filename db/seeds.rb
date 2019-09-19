require 'json'

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
Order.destroy_all
Product.destroy_all
Partner.destroy_all
User.destroy_all

filepath = 'db/data_coffe_founder.json'

coffees = File.read(filepath)

beers = JSON.parse(coffees)["resultat"]


puts "Seeding"
print "..."

user_1 = User.create!(first_name: "Laurent", last_name: "Korvisy", email: "laurent.korvisy@gmail.com", password: "lknd2kd1", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110119/peoples/adult-beard-blur-713520.jpg")
user_2 = User.create!(first_name: "Thomas", last_name: "Morin", email: "thomas.morin@gmail.com", password: "lknd2kdf", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110146/peoples/adult-bald-blur-1408196.jpg")
user_3 = User.create!(first_name: "Charlotte", last_name: "Goyard", email: "charlotte.goyard@gmail.com", password: "lknd2kdg", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110122/peoples/alone-beautiful-blurred-background-720598.jpg")
user_4 = User.create!(first_name: "Maxime", last_name: "Carneiro", email: "maxime.carneiro@gmail.com", password: "lknd2kdy", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110118/peoples/adult-beach-beard-736716.jpg")
user_5 = User.create!(first_name: "Calvin", last_name: "Ponsot", email: "calvin.ponsot@gmail.com", password: "lknd2kdy", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110118/peoples/adult-beach-beard-736716.jpg")
print ".."
user_6 = User.create!(first_name: "Rémi", last_name: "Falcoz", email: "remi.falcoz@gmail.com", password: "lknd2kdo", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110755/peoples/beard-casual-confidence-1878687.jpg")
user_7 = User.create!(first_name: "Chloé", last_name: "Rouby", email: "chloe.rouby@gmail.com", password: "lknd2kdl", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110104/peoples/beautiful-beauty-brown-eyes-1065084.jpg")
user_8 = User.create!(first_name: "Yasue", last_name: "Nobuyoki", email: "yasue.nobuyoki@gmail.com", password: "lknd2kd2", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110918/peoples/blurred-background-business-cafe-1125028.jpg")
user_9 = User.create!(first_name: "Joe", last_name: "Wayan", email: "joe.wayan@gmail.com", password: "lknd2kd@", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110758/peoples/beard-expression-face-1211605.jpg")
user_10 = User.create!(first_name: "Charlène", last_name: "Haskis", email: "charlene.haskis@gmail.com", password: "lknd2kd!", phone_number:"06 08 09 09 09", remote_photo_url:"https://res.cloudinary.com/di985lta5/image/upload/v1551110102/peoples/blur-casual-coffee-712513.jpg")

print "....."

# beers.each do |beer|
#   if beer["totalEncas"] < 1
#     coffe = Partner.new(name: beer["nom"], address: beer["adresse"], latitude: beer["latitude"], longitude: beer["longitude"], picture_1: "picture")
#     product = Product.new(name: "café suspendu", price_cents: 150)
#     product.partner = coffe
#   end
#   print "..."
#   if coffe
#     coffe.user = user_10
#     coffe.save
#     product.save
#   end
# end

partner_1 = Partner.new(name: "La Boîte à Café", address: "3 Rue de l'Abbé Rozier, 69001 Lyon", remote_photo_url: "https://cdn.welcometothejungle.co/uploads/image/file/1568/151033/large_bd49a239-5a1c-45c7-9050-4fc5189b4986.jpeg", description: "La Boîte à Café est le coffee shop de Mokxa, torréfacteur lyonnais de cafés fins. Dans le quartier des créateurs, sur les pentes de la Croix-Rousse, les barista vous accueillent pour déguster des cafés, des cakes ou des ciabattas pour la formule salée.", user_id: 1)
partner_2 = Partner.new(name: "Rakwé Café", address: "26 Rue René Leynaud, 69001 Lyon", remote_photo_url: "https://www.lyonexplorer.com/wp-content/uploads/2018/12/Rakwe-Elias-1024x683.jpg", description:"Un coffee shop à deux pas du métro croix paquet pour boire un bon café, déguster une pâtisserie ou découvrir de nouvelles saveurs.", user_id: 1)
partner_3 = Partner.new(name: "A Chacun Sa Tasse", address: "2 Rue du Griffon, 69001 Lyon", remote_photo_url: "http://www.happycurio.com/wp-content/uploads/2017/02/th%C3%A9-patisseries-lyon.jpg", description:"Thé, café, chocolat, jus de fruits... à chancun sa tasse !", user_id: 2)
partner_4 = Partner.new(name: "Diploid", address: "18 Rue de la Platière, 69001 Lyon", remote_photo_url: "https://ookiedough.org/wp-content/uploads/2018/01/DSC07127.jpg", description:"Une cellule « hybride » composée, de cuisiniers/pâtissiers et de baristas tous animés identiquement de la même passion : proposer des plats et des boissons d’excellente qualité, en choisissant rigoureusement des produits locaux et d’une grande fraîcheur.", user_id: 2)
partner_5 = Partner.new(name: "Le Perko Café", address: "8 Place du Griffon, 69001 Lyon", remote_photo_url: "https://www.leperkocafe.fr/wp-content/uploads/2018/01/2018-01-19_11-57-13__SDX5511_www.xavier-topalian.com_.jpg", description:"Le Perko vous propose un cadre apaisant de bicoque ancienne au fond des bois, pour savourer des cafés fraîchement torréfiés pour la sensualité, des thés pour voyager, des agrumes pressées pour des instants fruités, mais pas seulement...", user_id: 2)
partner_6 = Partner.new(name: "Slake", address: "9 Rue de l'Ancienne Préfecture, 69002 Lyon", remote_photo_url: "http://slake-coffee.com/wp-content/uploads/2017/03/Slake_coffee_house-lyon-89.jpg", description:"Ce café contemporain orné de grandes ardoises sert des boissons et collations dans un espace de partage.", user_id: 3)
# partner_7 = Partner.new(name: "Café Lisboa", address: "9 Rue des Quatre Chapeaux, 69002 Lyon", remote_photo_url: "https://i0.wp.com/www.carnetlyonnais.com/wp-content/uploads/2018/04/cafe-lisboa-restaurant-portugais-lyon-cordeliers-bonne-adresse-carnet-lyonnais-8.jpg", description:"Le Café Lisboa propose une cuisine portugaise typique dans un cadre convivial à Lyon, pour déjeuner, dîner ou faire une petite pause café / pastel de nata.", user_id: 4)
partner_8 = Partner.new(name: "Café Vert", address: "1 Montée des Épies, 69005 Lyon", remote_photo_url: "https://static4.pagesjaunes.fr/media/ugc/cafe_vert_06912300_194247987", description:"Manger sain, éthique et bon dans un cadre agréable à Lyon, ça vous tente ? Si oui, bienvenue au Café Vert ! Cuisine 100% bio, faite maison et vegan", user_id: 5)
partner_9 = Partner.new(name: "Café Bellecour", address: "33 Place Bellecour, 69002 Lyon", remote_photo_url: "https://static.apidae-tourisme.com/filestore/objets-touristiques/images/221/150/1545949.jpg", description:"Tables en bois et en marbre, peintures aux murs, grandes fenêtres ouvertes sur la place : Le café Bellecour est un café français ce qu’il y a de plus traditionnel et de plus agréable.", user_id: 5)

print "............"

partner_1.user = user_1
partner_2.user = user_2
partner_3.user = user_3
partner_4.user = user_4
partner_5.user = user_5
partner_6.user = user_6
# partner_7.user = user_7
partner_8.user = user_8
partner_9.user = user_9

product_1 = Product.new(name: "café suspendu", price_cents: 200)
product_2 = Product.new(name: "café suspendu", price_cents: 200)
product_3 = Product.new(name: "café suspendu", price_cents: 200)
product_4 = Product.new(name: "café suspendu", price_cents: 200)
product_5 = Product.new(name: "café suspendu", price_cents: 200)
product_6 = Product.new(name: "café suspendu", price_cents: 200)
# product_7 = Product.new(name: "café suspendu", price_cents: 200)
product_8 = Product.new(name: "café suspendu", price_cents: 200)
product_9 = Product.new(name: "café suspendu", price_cents: 200)

product_1.partner = partner_1
product_2.partner = partner_2
product_3.partner = partner_3
product_4.partner = partner_4
product_5.partner = partner_5
product_6.partner = partner_6
# product_7.partner = partner_7
product_8.partner = partner_8
product_9.partner = partner_9

product_1.save!
product_2.save!
product_3.save!
product_4.save!
product_5.save!
product_6.save!
# product_7.save!
product_8.save!
product_9.save!

partner_1.save!
partner_2.save!
partner_3.save!
partner_4.save!
partner_5.save!
partner_6.save!
# partner_7.save!
partner_8.save!
partner_9.save!


#Order.create!(user: user_2, partner: partner_1)
#Order.create!(user: user_2, partner: partner_7)
#print ".................."
#Order.create!(user: user_3, partner: partner_8)
#Order.create!(user: user_4, partner: partner_9)

puts "DB seeded sucessfully !"
