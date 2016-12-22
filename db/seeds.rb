# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(
	first_name: "Emmet", 
	last_name:  "Brickowski", 
	email:      "everythingisawesome@legomovie.com", 
	password:   "qwerty123", 
	password_confirmation: "qwerty123"
)
u1 = User.create(first_name:"Emmet", last_name:"Brickowski", email:"everythingisawesome@legomovie.com", password:"qwerty123", password_confirmation:"qwerty123")
u1.password_digest

m1 = Minifig.create(
	title:    "Mini Me", 
	head_id:  1, 
	torso_id: 1, 
	legs_id:  1, 
	content:  "This is what I look like!", 
	user_id:  u1.id
)

c1 = Comment.create(
	user_id:    u1.id, 
	minifig_id: m1.id, 
	content:    "That's a really good looking minifig!"
)