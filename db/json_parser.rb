require 'json'
require 'awesome_print'

filepath = 'db/data_coffe_founder.json'

coffees = File.read(filepath)

beers = JSON.parse(coffees)["resultat"]

beers.each do |beer|
  if beer["totalEncas"] < 1
    coffe = Partner.new(name: beer["nom"], address: beer["adresse"], latitude: beer["latitude"], longitude: beer["longitude"])
  end
  coffe.save!
end

puts beers.length
puts type.length


# "Bar
# Bar / Restaurant
# Restaurant
# Salon de thé
# Etablissement"
