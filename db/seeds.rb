# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all


# créer 15 utilisateurs
15.times do
	User.create(first_name:Faker::Games::Pokemon.name, last_name:Faker::Movies::Hobbit.character, description:Faker::Movies::Ghostbusters.quote, email:Faker::Internet.email, encrypted_password:Faker::Creature::Animal.name)
end

# créer 15 évènements
15.times do
	Event.create(location:Faker::Address.city, title:Faker::TvShows::TwinPeaks.quote, description:Faker::Movies::HarryPotter.quote, price:rand(1..1000), start_date:Faker::Date.between(from: 1.year.ago, to: 1.year.from_now), duration:rand(12..600)*5)
end

# créer 60 participants
Event.all.each do |this_event|
	all_users = User.all
	5.times do
		this_user = rand(all_users)
		all_users.delete(this_user)
		Participant.create(user_id:this_user.id, event_id:this_event.id)
	end
end