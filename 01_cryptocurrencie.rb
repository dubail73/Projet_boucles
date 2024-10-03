#Création de la liste : Deux tableaux sont créés, cryptomonnaies pour les noms et valeurs pour les prix.
cryptomonnaies = [
  "Bitcoin", "Ethereum", "XRP", "Bitcoin Cash", "EOS",
  "Litecoin", "Cardano", "Stellar", "IOTA", "Tether",
  "NEO", "TRON"
]

# Liste des valeurs correspondantes
valeurs = [
  "6558.07", "468.95", "0.487526", "762.84", "8.86", 
  "85.26", "0.151268", "0.206756", "1.18", "0.998033", 
  "39.47", "0.038865"
]

# Convertir les valeurs en nombres flottants
valeurs_numeriques = valeurs.map(&:to_f)

# Créer un hachage pour associer les cryptomonnaies à leurs valeurs
cryptomonnaies_hash = {}
cryptomonnaies.each_with_index do |crypto, index|
  cryptomonnaies_hash[crypto] = valeurs_numeriques[index]
end

# Afficher les résultats dans le format souhaité
puts "Liste des cryptomonnaies avec leurs valeurs :"
cryptomonnaies_hash.each do |nom, prix|
  puts "#{nom} #{prix}"
end

# 1. Trouver la cryptomonnaie avec la plus grosse valeur
crypto_max = cryptomonnaies_hash.max_by { |_, prix| prix }
puts "La cryptomonnaie avec la plus grosse valeur est : #{crypto_max[0]} avec un cours de #{crypto_max[1]}"

# 2. Trouver la cryptomonnaie avec la plus petite valeur
crypto_min = cryptomonnaies_hash.min_by { |_, prix| prix }
puts "La cryptomonnaie avec la plus petite valeur est : #{crypto_min[0]} avec un cours de #{crypto_min[1]}"

# 3. Trouver les devises dont le cours est inférieur à 6000
devises_inferieures_6000 = cryptomonnaies_hash.select { |_, prix| prix < 6000 }
puts "Les devises dont le cours est inférieur à 6000 :"
devises_inferieures_6000.each do |nom, prix|
  puts "#{nom} : #{prix}"
end

# 4. Trouver la devise la plus chère parmi celles dont le cours est inférieur à 6000
if devises_inferieures_6000.any?
    crypto_max_inferieure = devises_inferieures_6000.max_by { |_, prix| prix }
    puts "La devise la plus chère parmi celles dont le cours est inférieur à 6000 est : #{crypto_max_inferieure[0]} avec un cours de #{crypto_max_inferieure[1]}"
  else
    puts "Aucune devise n'est inférieure à 6000."
  end

