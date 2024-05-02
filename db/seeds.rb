require "faker"

User.destroy_all
Gossip.destroy_all
City.destroy_all
Tag.destroy_all
Message.destroy_all
Recipient.destroy_all

# Créer 10 villes aléatoires
cities = []
10.times do
  city = City.create!(name: Faker::Address.city)
  cities << city
end

# Créer 10 utilisateurs aléatoires avec leurs villes correspondantes
users = []
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 13, to: 60),
    city: cities.sample,
    password: Faker::Internet.password(min_length: 8)
  )
  users << user
  sleep(0.1) # Attendre 0.1 seconde entre chaque création d'utilisateur
end

puts "yolo"
# Créer des messages aléatoires associés à des utilisateurs
50.times do
  message = Message.create!(
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: users.sample
  )
  Recipient.create!(user: message.user, message: message)
  sleep(0.1) # Attendre 0.1 seconde entre chaque création de message
end

puts "yolo2"
# Créer 20 gossips aléatoires associés à des utilisateurs
20.times do
  gossip = Gossip.create!(
    title: Faker::Hacker.say_something_smart,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    user: users.sample
  )
  sleep(0.1) # Attendre 0.1 seconde entre chaque création de gossip
end

 20.times do
  random_gossip = Gossip.all.sample
  random_user = users.sample
  comment = Comment.create!(
    content: Faker::Lorem.paragraph(sentence_count: 3),
    gossip: random_gossip,
    user: random_user
  )
end
puts "yolo3"
# Créer 10 tags aléatoires
10.times do
  tag = Tag.create!(name: Faker::Lorem.word)
  sleep(0.1) # Attendre 0.1 seconde entre chaque création de tag
end

puts "yolo4"
# Associer chaque gossip à un ou plusieurs tags aléatoires
Gossip.all.each do |gossip|
  rand(1..5).times do
    gossip.tags << Tag.all.sample
  end
end
puts "yolo5"
# Méthode pour obtenir un utilisateur et un potin aléatoires
def random_user_and_gossip
  user = User.order("RANDOM()").first
  gossip = Gossip.order("RANDOM()").first
  return user, gossip
end

30.times do
  user, gossip = random_user_and_gossip
  Like.create(user: user, gossip: gossip)
end

puts "Seed finished successfully!"
