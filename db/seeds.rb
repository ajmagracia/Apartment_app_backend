# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(first_name:'Jerome', last_name:'Sheppard', email:'jerome@email.com', password:'password1')

user1 = User.create(first_name:'Mary', last_name:'San Agustin', email:'mary@email.com', password:'password2')

user2 = User.create(first_name:'Enrique', last_name:'Vega', email:'enrique@email.com', password:'password3')

Apartment.create(user_id: user1.id, street1:'123 J st', street2:'Apt 1', city:'San Diego', postal_code:92116, state:'CA', country:'United States', manager_name:'Jez Go', phone_number:'123-454-6789', contact_hours:'M-F: 9-5')

Apartment.create(user_id: user1.id, street1:'456 K st', street2:'Apt 2', city:'San Diego', postal_code:92105, state:'CA', country:'United States', manager_name:'Jez Go', phone_number:'234567890', contact_hours:'M-F: 9-5')

Apartment.create(user_id: user2.id, street1:'789 L st', street2:'Apt 3', city:'San Diego', postal_code:92568, state:'CA', country:'United States', manager_name:'Jez Go', phone_number:'345678901', contact_hours:'M-F: 9-5')
