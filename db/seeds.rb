# db/seeds.rb

# Création des utilisateurs
10.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "password", # Vous pouvez ajuster cela si nécessaire
    description: Faker::Lorem.paragraph(sentence_count: 2),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  puts "Utilisateur créé avec succès: #{user.email}"
end

# Création des événements
5.times do
  event = Event.new(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    start_date: Faker::Time.forward(days: 23, period: :morning),
    duration: rand(1..24),
    price: rand(10..100), # Prix aléatoire entre 10 et 100
    location: Faker::Address.full_address,
    user_id: User.pluck(:id).sample # Sélectionne un utilisateur aléatoire
  )

  if event.save
    puts "Événement créé avec succès: #{event.title}"
  else
    puts "Erreur lors de la création de l'événement: #{event.errors.full_messages.join(', ')}"
  end
end

