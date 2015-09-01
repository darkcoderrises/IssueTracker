# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

harshil = User.create(first_name: "Harshil", last_name: "Goel", email:"harshil@email.com", password_digest:"harshil")
natasha = User.create(first_name: "Natasha", last_name: "Sehgal", email:"natasha@email.com", password_digest:"natasha")

app1 = Project.create(name: "app1", description: "App1 description")
app2 = Project.create(name: "app2", description: "App2 description")
