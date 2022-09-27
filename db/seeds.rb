puts "Seeding aliens..."

20.times do
   Alien.create(
      name: Faker::Name.name,
      earth_disguise_name: Faker::Name.first_name,
      home_planet: Faker::Space.star,
      light_years_to_home_planet: rand(1..100)
   )
end

puts "Done seeding aliens."

puts "Seeding earthlings..."

20.times do
   Earthling.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      job: Faker::Job.title
   )
end

puts "Done seeding earthlings."

puts "Seeding visitations..."

50.times do
   Visitation.create(
      date: Faker::Date.backward(days: 365),
      alien_id: rand(1..20),
      earthling_id: rand(1..20)
   )
end

puts "Done seeding visitations."