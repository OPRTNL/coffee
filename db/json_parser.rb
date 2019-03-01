require 'json'
require 'awesome_print'

filepath = 'db/data_coffe_founder.json'

coffees = File.read(filepath)

beers = JSON.parse(coffees)["resultat"]

beers.each do |beer|
  if beer["totalEncas"] < 1
    coffe = Partner.new(name: beer["nom"], address: beer["adresse"], latitude: beer["latitude"], longitude: beer["longitude"])
    ap coffe.near("clermont-ferrand", 2000)
  end
  coffe.save!
end


# "Bar
# Bar / Restaurant
# Restaurant
# Salon de thé
# Etablissement"
