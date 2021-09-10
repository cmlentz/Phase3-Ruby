River.destroy_all

5.times do
  River.create(
    name: "#{Faker::FunnyName.name} River",
     country: Faker::Address.country
     )
end

puts 'Rivers seeded'


SingleFish.destroy_all

10.times do
  SingleFish.create(
    species: ["Brook Trout", "Arctic Grayling", "Yellow Perch", "Steelhead", "Blue Trout", 
    "Cachorra", "Red Piranha", "Alligator Gar", "Golden Dorado", "Electric Eel",
    "Golden Belly Barb", "Clown Knifefish", "Giant Snakehead", "Giant Featherback", "Albino Giant Freshwater Stingray",
    "Golden Perch", "Blue Yabby", "Barramundi", "Sleepy Cod", "Old Murray Cod"
  ].sample,
    weight: (1..200).to_a.sample,
    rarity: (0..10).to_a.sample,
    caught: [true, false].sample,
    river: River.all.sample
  )
end

puts 'Fish Seeded With Rivers'