require 'json'

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Partner.destroy_all
User.destroy_all
Order.destroy_all

filepath = 'db/data_coffe_founder.json'

coffees = File.read(filepath)

beers = JSON.parse(coffees)["resultat"]


puts "Seeding"
print "..."

user_1 = User.create!(first_name: "Laurent", last_name: "Korvisy", email: "laurent.korvisy@gmail.com", owner: false, password: "lknd2kd1", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110119/peoples/adult-beard-blur-713520.jpg")
user_2 = User.create!(first_name: "Thomas", last_name: "Morin", email: "thomas.morin@gmail.com", owner: false, password: "lknd2kdf", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110146/peoples/adult-bald-blur-1408196.jpg")
user_3 = User.create!(first_name: "Charlotte", last_name: "Goyard", email: "charlotte.goyard@gmail.com", owner: false, password: "lknd2kdg", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110122/peoples/alone-beautiful-blurred-background-720598.jpg")
user_4 = User.create!(first_name: "Maxime", last_name: "Carneiro", email: "maxime.carneiro@gmail.com", owner: false, password: "lknd2kdy", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110118/peoples/adult-beach-beard-736716.jpg")
user_5 = User.create!(first_name: "Calvin", last_name: "Ponsot", email: "calvin.ponsot@gmail.com", owner: false, password: "lknd2kdy", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110118/peoples/adult-beach-beard-736716.jpg")
print ".."
user_6 = User.create!(first_name: "Rémi", last_name: "Falcoz", email: "remi.falcoz@gmail.com", owner: false, password: "lknd2kdo", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110755/peoples/beard-casual-confidence-1878687.jpg")
user_7 = User.create!(first_name: "Chloé", last_name: "Rouby", email: "chloe.rouby@gmail.com", owner: false, password: "lknd2kdl", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110104/peoples/beautiful-beauty-brown-eyes-1065084.jpg")
user_8 = User.create!(first_name: "Yasue", last_name: "Nobuyoki", email: "yasue.nobuyoki@gmail.com", owner: true, password: "lknd2kd2", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110918/peoples/blurred-background-business-cafe-1125028.jpg")
user_9 = User.create!(first_name: "Joe", last_name: "Wayan", email: "joe.wayan@gmail.com", owner: true, password: "lknd2kd@", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110758/peoples/beard-expression-face-1211605.jpg")
user_10 = User.create!(first_name: "Charlène", last_name: "Haskis", email: "charlene.haskis@gmail.com", owner: true, password: "lknd2kd!", phone_number:"06 08 09 09 09", profile_picture:"https://res.cloudinary.com/di985lta5/image/upload/v1551110102/peoples/blur-casual-coffee-712513.jpg")

print "....."

beers.each do |beer|
  if beer["totalEncas"] < 1
    coffe = Partner.new(name: beer["nom"], address: beer["adresse"], latitude: beer["latitude"], longitude: beer["longitude"], picture_1: "picture")
  end
  if coffe
    coffe.user = user_10
    coffe.save
  end
end

partner_1 = Partner.new(name: "La Boîte à Café", address: "3 Rue de l'Abbé Rozier, 69001 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 1)
partner_2 = Partner.new(name: "Rakwé Café", address: "26 Rue René Leynaud, 69001 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 1)
partner_3 = Partner.new(name: "A Chacun Sa Tasse", address: "2 Rue du Griffon, 69001 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 2)
partner_4 = Partner.new(name: "Diploid", address: "18 Rue de la Platière, 69001 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 2)
partner_5 = Partner.new(name: "Le Perko Café", address: "8 Place du Griffon, 69001 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 2)
partner_6 = Partner.new(name: "Slake", address: "9 Rue de l'Ancienne Préfecture, 69002 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 3)
partner_7 = Partner.new(name: "Café Lisboa", address: "9 Rue des Quatre Chapeaux, 69002 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 4)
partner_8 = Partner.new(name: "Café Vert", address: "1 Montée des Épies, 69005 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 5)
partner_9 = Partner.new(name: "Café Bellecour", address: "33 Place Bellecour, 69002 Lyon", picture_1: "https://res.cloudinary.com/di985lta5/image/upload/v1551104888/adult-architectural-design-architecture-1438445.jpg", picture_2: "https://res.cloudinary.com/di985lta5/image/upload/v1551104901/chef-coffee-cook-887827.jpg", picture_3: "", user_id: 6)

print "............"

partner_1.user = user_1
partner_2.user = user_2
partner_3.user = user_3
partner_4.user = user_4
partner_5.user = user_5
partner_6.user = user_6
partner_7.user = user_7
partner_8.user = user_8
partner_9.user = user_9

product_1 = Product.new(name: "café suspendu", price_cents: 150)
product_2 = Product.new(name: "café suspendu", price_cents: 150)
product_3 = Product.new(name: "café suspendu", price_cents: 150)
product_4 = Product.new(name: "café suspendu", price_cents: 150)
product_5 = Product.new(name: "café suspendu", price_cents: 150)
product_6 = Product.new(name: "café suspendu", price_cents: 150)
product_7 = Product.new(name: "café suspendu", price_cents: 150)
product_8 = Product.new(name: "café suspendu", price_cents: 150)
product_9 = Product.new(name: "café suspendu", price_cents: 150)

product_1.partner = partner_1
product_2.partner = partner_2
product_3.partner = partner_3
product_4.partner = partner_4
product_5.partner = partner_5
product_6.partner = partner_6
product_7.partner = partner_7
product_8.partner = partner_8
product_9.partner = partner_9

product_1.save!
product_2.save!
product_3.save!
product_4.save!
product_5.save!
product_6.save!
product_7.save!
product_8.save!
product_9.save!

partner_1.save!
partner_2.save!
partner_3.save!
partner_4.save!
partner_5.save!
partner_6.save!
partner_7.save!
partner_8.save!
partner_9.save!


#Order.create!(user: user_2, partner: partner_1)
#Order.create!(user: user_2, partner: partner_7)
#print ".................."
#Order.create!(user: user_3, partner: partner_8)
#Order.create!(user: user_4, partner: partner_9)

puts "DB seeded sucessfully !"
